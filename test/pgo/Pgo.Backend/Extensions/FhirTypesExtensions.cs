using Hl7.Fhir.Model;
using System;
using System.Globalization;

namespace Pgo.Backend.Extensions;

public static class FhirTypesExtensions
{
    public static DateTime? ToSystemDateTime(this FhirDateTime fhirDateTime)
    {
        if (fhirDateTime == null || string.IsNullOrWhiteSpace(fhirDateTime.Value))
        {
            return null;
        }

        var dutchCulture = new CultureInfo("nl-NL");
        try
        {
            return DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-ddTHH:mm:ssK", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
        }
        catch (FormatException)
        {
            // Handle partial dates, such as just a year or year-month. Or return original value.
            try
            {
                return DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
            }
            catch
            {
                return null;
            }
        }
        catch (Exception)
        {
            return null;
        }
    }

    /// <returns>"2024-12-04T12:34:56.789Z"</returns>
    public static string ToTimestamp(this FhirDateTime fhirDateTime)
    {
        if (fhirDateTime == null || string.IsNullOrWhiteSpace(fhirDateTime.Value))
        {
            return string.Empty;
        }

        var dutchCulture = new CultureInfo("nl-NL");
        try
        {
            var dateTime = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-ddTHH:mm:ssK", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
            return dateTime.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ", dutchCulture); // "2024-12-04T12:34:56.789Z"
        }
        catch (FormatException)
        {
            // Handle partial dates, such as just a year or year-month. Or return original value.
            try
            {
                var partialDate = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
                return partialDate.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ", dutchCulture); // "2024-12-04T00:00:00.000Z"
            }
            catch
            {
                return fhirDateTime.Value;
            }
        }
        catch (Exception)
        {
            return fhirDateTime.Value;
        }
    }

    /// <returns>"5 december 2024 16:05"</returns>
    public static string ToHumanReadable(this FhirDateTime fhirDateTime)
	{
		if (fhirDateTime == null || string.IsNullOrWhiteSpace(fhirDateTime.Value))
		{
			return string.Empty;
		}

		var dutchCulture = new CultureInfo("nl-NL");
		try
		{
			var dateTime = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-ddTHH:mm:ssK", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
			return dateTime.ToString("f", dutchCulture); // "20 november 2024 16:05"
		}
		catch (FormatException)
		{
			// Handle partial dates, such as just a year or year-month. Or return original value.
			try
			{
				var partialDate = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
				return partialDate.ToString("D", dutchCulture);  // "20 november 2024"
			}
			catch
			{
				return fhirDateTime.Value;
			}
		}
		catch (Exception)
		{
			return fhirDateTime.Value;
		}
	}

	/// <returns>"5 december 2024"</returns>
	public static string ToHumanReadableDateOnly(this FhirDateTime fhirDateTime)
	{
		if (fhirDateTime == null || string.IsNullOrWhiteSpace(fhirDateTime.Value))
		{
			return string.Empty;
		}

		var dutchCulture = new CultureInfo("nl-NL");
		try
		{
			var dateTime = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-ddTHH:mm:ssK", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
			return dateTime.ToString("d MMMM yyyy", dutchCulture);
		}
		catch (FormatException)
		{
			// Handle partial dates, such as just a year or year-month. Or return original value.
			try
			{
				var partialDate = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
				return partialDate.ToString("D", dutchCulture);
			}
			catch
			{
				return fhirDateTime.Value;
			}
		}
		catch (Exception)
		{
			return fhirDateTime.Value;
		}
	}

	/// <returns>"16:05"</returns>
	public static string ToHumanReadableTimeOnly(this FhirDateTime fhirDateTime)
	{
		if (fhirDateTime == null || string.IsNullOrWhiteSpace(fhirDateTime.Value))
		{
			return string.Empty;
		}

		var dutchCulture = new CultureInfo("nl-NL");
		try
		{
			var dateTime = DateTime.ParseExact(fhirDateTime.Value, "yyyy-MM-ddTHH:mm:ssK", CultureInfo.InvariantCulture, DateTimeStyles.AssumeUniversal);
			return dateTime.ToString("HH:mm", dutchCulture); // "16:05"
		}
		catch (FormatException)
		{
			return fhirDateTime.Value;
		}
		catch (Exception)
		{
			return fhirDateTime.Value;
		}
	}
}