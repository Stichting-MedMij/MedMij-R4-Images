using System.Text.Json.Serialization;

namespace Pgo.Backend.Models.Clients;

public class DicomKosSeries
{
    [JsonPropertyName("0020000D")]
    public DicomKosStringValue? StudyInstanceUid { get; set; }

    [JsonPropertyName("0020000E")]
    public DicomKosStringValue? SeriesInstanceUid { get; set; }

    [JsonPropertyName("00081190")]
    public DicomKosStringValue? SeriesURL { get; set; }
}

public class DicomKosInstance
{
    [JsonPropertyName("00080018")]
    public DicomKosStringValue? SopInstanceUid { get; set; }

    [JsonPropertyName("00080016")]
    public DicomKosStringValue? SopClassUid { get; set; }

    public string SopClassType => SopClassUid?.GetStringValue() switch
    {
        "1.2.840.10008.5.1.4.1.1.1" => "Röntgenfilm",
        "1.2.840.10008.5.1.4.1.1.2" => "CT",
        "1.2.840.10008.5.1.4.1.1.4" => "MRI",
        "1.2.840.10008.5.1.4.1.1.6.1" => "Ultrasound echo",
        "1.2.840.10008.5.1.4.1.1.12.1" => "Angiografie",
        "1.2.840.10008.5.1.4.1.1.12.2" => "Fluoroscopie",
        "1.2.840.10008.5.1.4.1.1.20" => "Scintigram",
        "1.2.840.10008.5.1.4.1.1.128" => "PET",
        "1.2.840.10008.5.1.4.1.1.66" => "MRI (multiframe)",
        "1.2.840.10008.5.1.4.1.1.67" => "CT (multiframe)",
        "1.2.840.10008.5.1.4.1.1.130" => "PET (multiframe)",
        _ => string.Empty,
    };

    [JsonPropertyName("00081160")]
    public DicomKosStringValue? Frames { get; set; }
}

public class DicomKosStringValue
{
    [JsonPropertyName("Value")]
    public List<string>? Value { get; set; }

    public string? GetStringValue()
    {
        return Value?.FirstOrDefault();
    }

    public List<string> GetStringValues()
    {
        return Value ?? [];
    }

    public List<int> GetIntegerValues()
    {
        return GetStringValues().ToArray().Select(int.Parse).ToList();
    }
}
