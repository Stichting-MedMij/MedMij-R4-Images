namespace Pgo.Backend.Config;

public class OpenIdConnectConfig
{
    public string Authority { get; set; } = string.Empty;
    public string ClientId { get; set; } = string.Empty;
    public string ClientSecret { get; set; } = string.Empty;
    public string ResponseType { get; set; } = string.Empty;
    public string ResponseMode { get; set; } = "query";
    public List<string> Scopes { get; set; } = [];
    public bool SaveTokens { get; set; } = false;
    public bool GetClaimsFromUserInfoEndpoint { get; set; } = false;
    public bool RequireHttpsMetadata { get; set; } = true;
}