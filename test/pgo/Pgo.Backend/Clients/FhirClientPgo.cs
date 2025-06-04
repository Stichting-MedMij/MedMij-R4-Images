using Hl7.Fhir.Rest;

namespace Pgo.Backend.Clients;

/// <summary>
/// Interface for named wrapper class around FhirClient for dependency injection and tests.
/// </summary>
public interface IFhirClientPgo
{
	public FhirClient Client { get; set; }
}

/// <summary>
/// Named wrapper classes around FhirClient.
/// </summary>
public class FhirClientPgo : IFhirClientPgo
{
	public required FhirClient Client { get; set; }
}
