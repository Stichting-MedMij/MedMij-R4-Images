namespace Pgo.Backend.Config;

public class PgoConfig
{
    public string BasePath { get; set; } = string.Empty;
	public string FhirEndpoint { get; set; } = string.Empty;
	public bool IsBehindProxy { get; set; } = false;
    public string StelselNodeBaseUrl { get; set; } = string.Empty;
    public int UpdateStelselNodeIntervalMinutes { get; set; } = 15;
}