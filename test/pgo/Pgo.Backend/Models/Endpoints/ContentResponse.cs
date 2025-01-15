using Hl7.Fhir.Model;
using Pgo.Backend.Extensions;
using System.Globalization;
using static Pgo.Backend.Models.Endpoints.ContentResponse;

namespace Pgo.Backend.Models.Endpoints;

public class ContentResponse
{
    public List<ContentResponse.DocumentReferenceContentItem> DocumentReferenceContentItems { get; set; } = new();

    /// <summary>
    /// https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html
    /// </summary>
    public class DocumentReferenceContentItem
    {
        // DocumentReference
        public string? Id { get; set; }
        public List<KeyValuePair<string, string>> Author { get; set; } = new();
        public string? Description { get; set; }
        public string? GroupName { get; set; }
        public string? TypeCode { get; set; }
        public string? Provider { get; set; }

        // DocumentRefrence.content[1..1].attachment
        public string? ContentType { get; set; } // [1..1]
        public string? Language { get; set; }
        public string? Url { get; set; } // [1..1]
        public string? Size { get; set; }
        public string? Hash { get; set; }
        public string? Title { get; set; }
        public string? CreationTimestamp { get; set; }
        public string? CreationDate { get; set; }
        public string? CreationYear { get; set; }
        public string? CreationTime { get; set; }

        // DocumentRefrence.format[0..1].display
        public string? FormatDisplay { get; set; }
    }

    public static ContentResponse From(Bundle? bundle)
    {
        var response = new ContentResponse();
        foreach (var entry in bundle?.Entry ?? new())
        {
            var resource = entry.Resource as DocumentReference;
            if (resource == null)
            {
                continue;
            }

            var attachment = resource.Content.FirstOrDefault()?.Attachment; // R4.DocumentReference.Minimal applies at most one attachment.
            var dutchCulture = new CultureInfo("nl-NL");
            var creation = attachment?.CreationElement?.ToSystemDateTime();
            var item = new DocumentReferenceContentItem()
            {
                Id = resource.Id,
                Description = resource.Description,
                GroupName = response.DocumentReferenceContentItems.FindContextRelatedGroupNameOrDefault(resource.Context.Related),
                TypeCode = resource.Type?.Coding.FirstOrDefault(coding => coding.Code == "REPORTS" || coding.Code == "IMAGES")?.Code,
                Provider = resource.Custodian?.Display, // Custodian organization is providing, but not per se the same as healthcare provider (zorgaanbieder or zorginstelling).
                ContentType = attachment?.ContentType,
                Language = attachment?.Language,
                Url = attachment?.Url,
                Size = attachment?.Size.ToHumanReadable(),
                Hash = Convert.ToBase64String(attachment?.Hash ?? Array.Empty<byte>()),
                Title = attachment?.Title,
                CreationTimestamp = creation?.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ", dutchCulture) ?? attachment?.CreationElement.Value, // "2024-12-04T12:34:56.789Z"
                CreationYear = creation?.ToString("yyyy", dutchCulture) ?? attachment?.CreationElement.Value,
                CreationDate = creation?.ToString("d MMMM yyyy", dutchCulture) ?? attachment?.CreationElement.Value,
                CreationTime = creation?.ToString("HH:mm", dutchCulture) ?? attachment?.CreationElement.Value,
                FormatDisplay = resource.Content.FirstOrDefault()?.Format?.Display,
            };

            foreach (var author in resource.Author.OrderBy(author => !author.Reference.StartsWith("Organization/")))
            {
                item.Author.Add(new(author.Reference, author.Display));
            }

            response.DocumentReferenceContentItems.Add(item);
        }

        return response;
    }
}

public static class DocumentReferenceContentItemExtensions
{
    /// <summary>
    /// Very simple matching of related items by iterating over resources and having a group name of resource.id.
    /// Matching items with a relatedTo field copy the group name. Simple grouping with a small ser for prototyping.
    /// </summary>
    public static string? FindRelatedToGroupNameOrDefault(this List<DocumentReferenceContentItem> knownItems, List<DocumentReference.RelatesToComponent> relatedItems, string? defaultGroupName = null)
    {
        var relatedToIds = relatedItems
            .Select(relatedToItem => relatedToItem?.Target?.Url?.ToString().Replace($"{nameof(DocumentReference)}/", ""))
            .Where(relatesToId => !string.IsNullOrWhiteSpace(relatesToId))
            .ToList();

        return knownItems
            .Where(item => relatedToIds.Contains(item.Id))
            .Select(item => item.GroupName)
            .FirstOrDefault() ?? defaultGroupName;
    }

    /// <summary>
    /// Very simple matching of related items by taking the first literal identifier or logical reference from context.
    /// </summary>
    public static string? FindContextRelatedGroupNameOrDefault(this List<DocumentReferenceContentItem> knownItems, List<ResourceReference> contextReferences, string? defaultGroupName = null)
    {
        var reference = contextReferences.FirstOrDefault();
        return reference?.Reference ?? reference?.Identifier?.Value ?? defaultGroupName;
    }
}

/*
{
  "resourceType": "DocumentReference",
  "id": "voorbeeld-75",
  "meta": {
    "profile": [
      "https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference"
    ]
  },
  "subject": {
    "reference": "Patient/voorbeeldgebruiker",
    "display": "A. Voorbeeldgebruiker"
  },
  "author": [
    {
      "reference": "PractitionerRole/MM-R4-Images-PractitionerRole-Janssen",
      "display": "C.H. Coenen, Kaakchirurg, Erasmus MC, Mondzorg en kaakchirurgie"
    },
    {
      "reference": "Organization/MM-R4-Images-Organization-Erasmus-MC-Radiologie",
      "display": "Erasmus MC, Radiologie"
    }
  ],
  "custodian": {
    "reference": "Organization/MM-R4-Images-Organization-Erasmus-MC-Radiologie",
    "display": "Erasmus MC, Radiologie"
  },
  "masterIdentifier": {
    "system": "urn:ietf:rfc:3986",
    "value": "urn:uuid:d7236f3e-5c10-4caf-9864-255baa23611b"
  },
  "status": "current",
  "date": "2020-08-10T12:00:00Z",
  "relatesTo" : [
    {
      "code" : {
        "coding" : [{
          "system" : "http://hl7.org/fhir/document-relationship-type",
          "code" : "appends"
        }]
      },
      "target" : {
        "reference" : "DocumentReference/voorbeeld-76"
      }
    }
  ],
  "context": {
    "period": {
      "start": "2020-08-10"
    }
  },
  "content": [
    {
      "attachment": {
        "contentType": "application/dicom+json",
        "creation": "2020-08-10T12:00:00Z",
        "url": "https://pacs.interoplab.eu/dcm4chee-arc/aets/DCM4CHEE/rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/1.3.12.2.1107.5.1.4.73251.30000018040906002434600017837/instances/1.3.12.2.1107.5.1.4.73251.30000018040906002434600018222",
        "language": "nl"
      }
    }
  ],
  "type": {
    "coding": [
      {
        "code": "18726-0",
        "system": "http://loinc.org",
        "display": "Radiology studies (set)"
      },
      {
        "code": "IMAGES",
        "system": "urn:oid:1.3.6.1.4.1.19376.1.2.6.1",
        "display": "Images"
      }
    ]
  }
}
*/