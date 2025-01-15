using Hl7.Fhir.Model;

namespace Pgo.Backend.Config;

public class DvaConfig
{
	public string FhirEndpoint { get; set; } = string.Empty;
	public string DicomTokenEndpoint { get; set; } = string.Empty;
	public string DicomTokenClientId { get; set; } = string.Empty;
	public string DicomTokenClientSecret { get; set; } = string.Empty;
	public string DicomTokenClientScope { get; set; } = string.Empty;
	public string DicomWadoRSEndpoint { get; set; } = string.Empty;
}
