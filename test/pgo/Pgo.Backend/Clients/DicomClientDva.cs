using HttpMultipartParser;
using Microsoft.Health.Dicom.Client;
using Pgo.Backend.Models.Clients;
using Pgo.Backend.Models.Endpoints;
using System.Text.Json;
using static Pgo.Backend.Models.Endpoints.DocumentSearchResponse;

namespace Pgo.Backend.Clients;

/// <summary>
/// Interface for named wrapper class around DicomWebClient for dependency injection and tests.
/// </summary>
public interface IDicomClientDva
{
	public DicomWebClient Client { get; set; }
}

/// <summary>
/// Named wrapper classes around DicomWebClient.
/// </summary>
public class DicomClientDva : IDicomClientDva
{
	public required DicomWebClient Client { get; set; }
}

//namespace Pgo.Backend.Clients.Extensions

/// <summary>
/// https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri/
/// https://www.dicomstandard.org/using/dicomweb
/// https://learn.microsoft.com/en-us/azure/healthcare-apis/dicom/dicomweb-standard-apis-c-sharp
/// https://github.com/Http-Multipart-Data-Parser/Http-Multipart-Data-Parser
/// https://github.com/dcm4che/dicomweb?tab=readme-ov-file
/// </summary>
public static class DicomClientExtensions
{
    /// <example>dicom.GetKosForStudy("https://pacs/wado-rs/studies/1.2.300.0.40.12345.6789/series")</example>
    public static async Task<KosDocument> GetKosForStudySeries(this IDicomWebClient dicom, string studySeriesKosUrl, bool includeInstances = true)
	{
        var studyKosResponse = await dicom.HttpClient.GetAsync(studySeriesKosUrl);
        studyKosResponse.EnsureSuccessStatusCode();

        var studyKos = await studyKosResponse.Content.ReadAsStringAsync();
        var seriesKos = JsonSerializer.Deserialize<List<DicomKosSeries>>(studyKos) ?? [];
        var studyId = seriesKos.FirstOrDefault()?.StudyInstanceUid?.GetStringValue();
        var study = new KosDocument()
        {
            StudyUid = studyId
        };

        foreach (var seriesInstance in seriesKos)
        {
            var series = new DicomSeries() { SeriesUid = seriesInstance.SeriesInstanceUid?.GetStringValue() };
            var seriesUrl = seriesInstance?.SeriesURL?.GetStringValue();
            study.Series.Add(series);

            if (includeInstances && seriesUrl != null)
			{
                series.Instances.AddRange(await dicom.GetKosForSeriesInstances($"{seriesUrl}/instances"));
            }
        }        

        return study;
    }

    /// <example>dicom.GetKosForSeriesInstances("https://pacs/wado-rs/studies/1.2.300.0.40.12345.6789/series/1.3.12.2.1107.5.1.4/instances")</example>
    public static async Task<List<DocumentSearchResponse.DicomInstance>> GetKosForSeriesInstances(this IDicomWebClient dicom, string instancesKosUrl)
	{
        var instancesKosResponse = await dicom.HttpClient.GetAsync(instancesKosUrl);
        instancesKosResponse.EnsureSuccessStatusCode();

        var instancesJson = await instancesKosResponse.Content.ReadAsStringAsync();
        var instancesKos = JsonSerializer.Deserialize<List<DicomKosInstance>>(instancesJson);		

		var instances = new List<DocumentSearchResponse.DicomInstance>();
		foreach (var instance in instancesKos ?? [])
		{
			instances.Add(new()
            {
                InstanceUid = instance.SopInstanceUid?.GetStringValue(),
                InstanceType = instance.SopClassType,
                Frames = instance.Frames?.GetIntegerValues() ?? []
            });
        }
		return instances;
    }

    /// <example>dicom.GetDicomFile("https://pacs/wado-rs/studies/1.2.300.0.40.12345.6789")</example>
    public static async Task<IReadOnlyList<FilePart>> GetDicomFile(this IDicomWebClient dicom, string studyOrInstanceUrl)
    {
        dicom.HttpClient.DefaultRequestHeaders.Accept.Clear();
        var response = await dicom.HttpClient.GetAsync(studyOrInstanceUrl);
        if (!response.IsSuccessStatusCode)
        {
            throw new FileNotFoundException("Failed to retrieve DICOM file.");
        }

        switch (response.Content.Headers.ContentType?.MediaType)
        {
            case DicomWebConstants.MultipartRelatedMediaType:
            {
                var stream = await response.Content.ReadAsStreamAsync();
                var parser = await MultipartFormDataParser.ParseAsync(stream);
                return parser.Files;
            }

            default:
            {
                var stream = await response.Content.ReadAsStreamAsync();
                string contentType = response.Content.Headers.ContentType?.MediaType ?? "application/octet-stream";
                return new List<FilePart> { new FilePart("file", "file", stream, contentType, "attachment") };
            }
        }
    }
}