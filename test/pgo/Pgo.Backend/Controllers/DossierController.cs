using Duende.Bff;
using Hl7.Fhir.Model;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Pgo.Backend.Clients;
using Pgo.Backend.Models.Endpoints;

namespace Pgo.Backend.Controllers;

[BffApi]
[Authorize]
[ApiController]
public class DossierController(ILogger<DocumentController> logger, IFhirClientPgo pgo, IFhirClientDva dva) : ControllerBase
{
	private readonly ILogger<DocumentController> _logger = logger;
	private readonly IFhirClientPgo _pgo = pgo;
	private readonly IFhirClientDva _dva = dva;

    /// <summary>
    /// Fetch a set of DocumentReference for currrent logged-in Patient user. As an example,
	/// we have these stored in a FHIR server. Some PGOs have different store mechanisms.
    /// </summary>
    [HttpGet("api/dossier/documentreferences")]
    public async Task<ActionResult<ContentResponse>> GetDocumentReferences()
    {
        var patientId = User.FindFirst("sub")?.Value ?? "";
        var bundle = await _pgo.Client.SearchAsync<DocumentReference>(new string[] { $"subject=Patient/{patientId}" });
        var response = ContentResponse.From(bundle);

        return Ok(response);
    }

    /// <summary>
    /// Simulation of data exchange with FHIR resource servers at DVA. Here, we simply import
	/// a set of DocumentReferences for a Patient from DVA FHIR server into PGO FHIR server.
	/// In reality this process is much more complex, and out of scope for a light prototype.
    /// </summary>
    [HttpGet("api/dossier/import")]
	public async Task<IActionResult> ImportFhirDataFromDva()
	{
		var patientId = User.FindFirst("sub")?.Value ?? "";
		var found = await _dva.Client.SearchAsync<DocumentReference>(new string[] { $"subject=Patient/{patientId}" });
		_logger.LogInformation($"Found {found!.Entry.Count} DocumentReferences in DVA FHIR-server.");

		foreach (var entry in found!.Entry)
		{
			var resource = entry.Resource as DocumentReference;
			_logger.LogInformation($"Creating a copy of DVA DocumentReference {resource?.Id} in PGO.");
			await _pgo.Client.UpdateAsync(resource!);
		}

		return Ok(StatusResponse.Ok(found!.Entry.Count.ToString()));
	}

	[HttpGet("api/dossier/reset")]
	public async Task<IActionResult> RemoveFhirDataFromDva()
	{
		var found = await _pgo.Client.SearchAsync<DocumentReference>();
		foreach (var entry in found!.Entry)
		{
			var location = entry.GetResourceLocation();
			_logger.LogInformation($"Deleting DocumentReference {entry.Resource.Id} from PGO FHIR-server.");
			await _pgo.Client.DeleteAsync(location.MakeRelative());
		}
		return Ok(StatusResponse.Ok(found!.Entry.Count.ToString()));
	}
}