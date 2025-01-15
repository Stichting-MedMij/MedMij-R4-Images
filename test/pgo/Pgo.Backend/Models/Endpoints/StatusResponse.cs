namespace Pgo.Backend.Models.Endpoints;

/// <summary>
/// Response wrapper view model for status messages.
/// </summary>
public class StatusResponse
{
    public bool IsSuccess { get; set; } = true;
    public string Message { get; set; } = "";

    public static StatusResponse Ok(string message = "") => new StatusResponse() { Message = message };
    public static StatusResponse Error(string message = "") => new StatusResponse() { Message = message, IsSuccess = false };
}
