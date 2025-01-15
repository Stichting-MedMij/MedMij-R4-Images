namespace Pgo.Backend.Models.Endpoints;

/// <summary>
/// List of DocumentReference resources to search verslag and beeld for.
/// Verslagen (reports) are referenced as full URIs to PDF documents,
/// while beelden (images) are found by querying and parsing DICOMweb KOS.
/// </summary>
public class DocumentSearchRequest
{
    public string[] DocumentReferenceIds { get; set; } = [];
}

/// <summary>
/// Returns a list of found FHIR DocumentReference resources and the unique identifiers of documents referred to in linked studies.
/// </summary>
public class DocumentSearchResponse
{
    public List<PdfDocument> Pdf { get; set; } = [];
    public List<KosDocument> Kos { get; set; } = [];

    /// <summary>
    /// PDF report selection (Verslag).
    /// </summary>
    public class PdfDocument
    {
        public string? DocumentReferenceId { get; set; }
        public string? Url { get; set; }
    }

    /// <summary>
    /// Key object selection document with unique identifiers to available images in a study (Beeld).
    /// </summary>
    public class KosDocument
    {
        public string? DocumentReferenceId { get; set; }
        
        public string? StudyUid { get; set; }
        //public string StudyInstanceUid { get; set; }
        //public string SeriesInstanceUid { get; set; }
        //public string SopInstanceUid { get; set; }
        public List<DicomSeries> Series { get; set; } = [];
    }

    public class DicomSeries
    {
        public string? SeriesUid { get; set; }
        public List<DicomInstance> Instances { get; set; } = [];
        
    }

    public class DicomInstance
    {
        public string? InstanceUid { get; set; }
        public string? InstanceType { get; set; }
        public List<int>? Frames { get; set; } = [];
        //public string InstanceUrl => $"studies/{StudyId}/series/{SeriesId}/instances/{InstanceId}";
    }

}
