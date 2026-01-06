---
topic: RefArch
---

# Reference architecture

## Scope and context
This page provides architectural context for Image Availability when the backend of a XIS is based on an XDS/XCA infrastructure.

The MedMij agreements describe the interactions between the PHR and the XIS. The internal architecture behind the XIS, including the use of XDS/XCA infrastructures, is outside the formal scope of MedMij. This page serves as informative guidance for implementations that connect a XIS to an XDS/XCA-based backend.

## Architectural overview
Figure 1 illustrates the reference architecture for Image Availability using an XDS/XCA backend.

The figure shows that the PHR interacts exclusively with the XIS within the MedMij domain. The XIS mediates access to the healthcare provider domain through an XDS/XCA Gateway exposing RESTful interfaces to an underlying XDS environment.

RESTful transactions used between the PHR and the XIS are translated by the gateway to semantically equivalent XDS/XCA transactions towards the backend systems.

{{render: guides/medmij-r4-image-availability-ig/images/Reference architecture.png}}

**Figure 1: Reference architecture for Image Availability using an XDS/XCA backend**

## Transaction equivalence
The RESTful transactions used within the MedMij Image Availability context are based on IHE profiles that explicitly define their relationship to XDS and XCA transactions.

For XDS/XCA-based backends, the following conceptual equivalences apply:

- [MHD ITI-67 (Find Document References)](https://profiles.ihe.net/ITI/MHD/ITI-67.html) corresponds to [XDS Registry Stored Query (ITI-18)](https://profiles.ihe.net/ITI/TF/Volume2/ITI-18.html);
- [MHD ITI-68 (Retrieve Document)](https://profiles.ihe.net/ITI/MHD/ITI-68.html) corresponds to [XDS Retrieve Document Set (ITI-43)](https://profiles.ihe.net/ITI/TF/Volume2/ITI-43.html);
- [WADO-RS (RAD-107)](https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri) corresponds to XDS imaging retrieval semantics as defined by Retrieve Imaging Document Set (RAD-69).

The concrete transport bindings used within the XDS/XCA environment are implementation details and fall outside the scope of MedMij.

## Mapping references
IHE provides normative documentation describing how RESTful query and retrieval parameters map to XDS/XCA parameters and identifiers. These mappings are maintained by IHE and are considered authoritative.

Relevant mapping documentation includes:

- Mapping of MHD ITI-67 to XDS ITI-18 (Registry Stored Query):  
  https://profiles.ihe.net/ITI/MHD/ITI-67.html  
  (see Table 2:3.67.4.1.3.1-1 – ITI-18 FindDocuments Query Parameter Mapping)

- Mapping of MHD ITI-68 to XDS ITI-43 (Retrieve Document Set):  
  https://profiles.ihe.net/ITI/MHD/ITI-68.html

Implementations connecting a XIS to an XDS/XCA backend are expected to follow these IHE-defined mappings when translating RESTful requests to XDS/XCA transactions.

## Authorization context
For interactions between the XIS and the XDS/XCA Gateway, requests are secured using JWT-based authorization. The XIS enriches the JWT with claims aligned with the IHE Internet User Authorization (IUA) profile, providing the contextual information required for authorization and audit logging within the XDS environment.

Figure 2 illustrates the sequence of interactions between the XIS and the XDS/XCA backend when using JWT-based authorization aligned with IHE IUA.

{{render: guides/medmij-r4-image-availability-ig/images/Sequence XIS XDS.png}}

**Figure 2: JWT-based authorization flow between XIS and XDS/XCA backend**

### Example IUA claim structure
An example of the IUA-related claims included in the JWT is shown below. This example is illustrative and non-normative.

```json
{
  "extensions": {
    "ihe-iua": {
      "subject-name": "John Doe",
      "subject-role": [
        {
          "code": "116154003",
          "system": "urn:oid:2.16.840.1.113883.6.96",
          "display": "Patient"
        }
      ],
      "purpose-of-use": [
        {
          "code": "6",
          "system": "1.0.14265.1",
          "display": "Subject of Care Uses"
        }
      ],
      "person_id": "999999990^^^&2.16.840.1.113883.2.4.6.3&ISO"
    }
  }
}
```