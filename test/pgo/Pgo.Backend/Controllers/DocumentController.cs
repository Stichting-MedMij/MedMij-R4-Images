using Hl7.Fhir.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Health.Dicom.Client;
using Pgo.Backend.Clients;
using Pgo.Backend.Models.Endpoints;
using System.Net.Mime;

namespace Pgo.Backend.Controllers;

/// <summary>
/// Example controller example fetching documents like PDF reports and DICOM images.
/// These documents are referenced by FHIR DocumentReference resources in a dossier.
/// DICOMweb HTTP client simply fetches WADO-endpoints with an Authorization header
/// to return DICOM Part10 archives or JPEG rendered parts for use in frontend.
/// See https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri/
/// </summary>
[ApiController] // [ApiController, Authorize, BffApi]
public class DocumentController(ILogger<DocumentController> logger, IFhirClientPgo fhir, IDicomClientDva dicom) : ControllerBase
{
    private readonly ILogger<DocumentController> _logger = logger;
	private readonly IFhirClientPgo _fhir = fhir;
	private readonly IDicomWebClient _dicom = dicom.Client;


    /// <summary>
    /// Takes a search query with identifiers from frontend, looks up the matching DocumentReferences,
    /// and returns an overview of matching PDFs and DICOM documents. i.e. POST /api/document/search
    /// with a JSON body { "documentReferenceIds": [ "DocumentReference-55", "DocumentReference-56" ] }
    /// Frontend uses these references to fetch the actual document bytes in-time when user views them.
    /// </summary>
    [HttpPost("api/document/search")]
    public async Task<ActionResult<DocumentSearchResponse>> PostDocumentSearch(DocumentSearchRequest request)
    {
        var response = new DocumentSearchResponse();
        foreach (var documentReferenceId in request.DocumentReferenceIds)
        {
            var attachment = await GetFhirDocumentReferenceAttachmentById(documentReferenceId);

            switch (attachment.ContentType)
            {
                
                case "application/pdf":
                    // Example: https://pacs/webserver/report.pdf
                    response.Pdf.Add(new() { DocumentReferenceId = documentReferenceId, Url = attachment.Url });
                    break;

                
                case "application/dicom+json":
                    // Example: https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series
                    var kos = await _dicom.GetKosForStudySeries(attachment.Url, includeInstances: true);
                    kos.DocumentReferenceId = documentReferenceId;
                    response.Kos.Add(kos);
                    break;

                default:
                    _logger.LogWarning($"Unsupported content type {attachment.ContentType} for resource {documentReferenceId}.");
                    break;
            }
        }

        return response;
    }

    /// <summary>
    /// Takes a DocumentReference.id, finds it's attachment.url, fetches the PDF-document and returns the
    /// PDF document as base64 string to help prevent storing in browser cache. Alternatively, frontend
    /// can retrieve documents by url directly, but most likely PGO adds an Authorization header, etc.
    /// </summary>
    [HttpGet("api/document/pdf/{documentReferenceId}")]
    public async Task<IActionResult> GetPdfDocument(string documentReferenceId)
    {
        var attachment = await GetFhirDocumentReferenceAttachmentById(documentReferenceId);
        var response = await _dicom.HttpClient.GetAsync(attachment.Url); // https://pgo-beeldinpgo.t5t.nl/web/demo/temp-persoon-3_verslag.pdf
        response.EnsureSuccessStatusCode();

        var pdfBytes = await response.Content.ReadAsByteArrayAsync();
        var base64String = Convert.ToBase64String(pdfBytes);
        return Content(base64String, "text/plain");
    }

    /// <summary>
    ///  Takes a DocumentReference.id, finds it's attachment.url pointing to a WADO-RS KOS endpoint.
    ///  Resolves requested DICOM instance and returns a rendered JPEG as base64 string. Optionally,
    ///  frontend can request a specific frame from a multi-frame instance. In prototype we currently
    ///  don't read multi-frame instances in dataset, but scrolling through frames (e.g. slider control)
    ///  like browsing instances in a study is a workable must-have feature for modern DICOM viewers. 
    /// </summary>
    [HttpGet("api/document/jpeg/{documentReferenceId}/{studyUid}/{seriesUid}/{instanceUid}/{frameId?}")]
    public async Task<IActionResult> GetDicomImageRendered(string documentReferenceId, string studyUid, string seriesUid, string instanceUid, int? frameId = 0)
    {
        var optionalFrameUrl = frameId > 0 ? $"frames/{frameId}" : "";
        var attachment = await GetFhirDocumentReferenceAttachmentById(documentReferenceId);
        var files = await _dicom.GetDicomFile($"{attachment.Url}/{seriesUid}/instances/{instanceUid}{optionalFrameUrl}/rendered");
        var file = files.FirstOrDefault() ?? throw new FileNotFoundException(attachment.Url);
        using var memoryStream = new MemoryStream();
        await file.Data.CopyToAsync(memoryStream);
        var fileBytes = memoryStream.ToArray();
        var base64String = Convert.ToBase64String(fileBytes);
        return Content(base64String, "text/plain");
    }

    /// <summary>
    /// Takes a DocumentReference.id, finds it's attachment.url pointing to a WADO-RS KOS endpoint.
    /// Fetches the study as DICOM Part10. Returns the document with content-disposition for download.
    /// Optionally, frontend can request a specific series or instance for the DICOM container file.
    /// </summary>
    [HttpGet("api/document/dicom/{documentReferenceId}/{studyUid}/{seriesUid?}/{instanceUid?}")]
    public async Task<IActionResult> GetDicomArchiveDownload(string documentReferenceId, string? studyUid, string? seriesUid, string? instanceUid)
    {
        var attachment = await GetFhirDocumentReferenceAttachmentById(documentReferenceId);
        var downloadUrl = attachment.Url.Replace("/series", "");
        if (seriesUid != null)
        {
            // Example: downloadUrl https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series
            // Example: downloadUrl https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885
            // Example: downloadUrl https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/12345/instances/67890
            downloadUrl += $"/series/{seriesUid}";
            if (instanceUid != null)
            {
                downloadUrl += $"/instances/{instanceUid}";
            }
        }

        var parts = await _dicom.GetDicomFile(attachment.Url);
        var file = parts.FirstOrDefault() ?? throw new FileNotFoundException(attachment.Url);
        Response.Headers.Append("X-Content-Type-Options", "nosniff");
        Response.Headers.Append("Content-Disposition", new ContentDisposition
        {
            FileName = attachment.Title,
            Inline = true
        }.ToString());
        return new FileStreamResult(file.Data, file.ContentType);
    }

    private async Task<Attachment> GetFhirDocumentReferenceAttachmentById(string id)
    {
        var resource = await _fhir.Client.ReadAsync<DocumentReference>($"{nameof(DocumentReference)}/{id}");
        return resource?.Content.FirstOrDefault()?.Attachment ?? throw new Exception($"Attachment not found in DocumentReference {id}.");
    }
}