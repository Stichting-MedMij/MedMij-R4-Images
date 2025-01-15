namespace Pgo.Backend.OpenTelemetry;

public class OpenTelemetryConfig
{
    public bool Enabled { get; set; } = false; 
    public string ServiceName { get; set; } = string.Empty;
    public string OTLPEndpoint { get; set; } = string.Empty;
}