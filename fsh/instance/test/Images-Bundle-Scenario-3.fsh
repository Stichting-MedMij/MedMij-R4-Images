//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 3

Instance: Images-DocumentReference-Klaassen-Groen-Image-3-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(Images-Patient-De-Graaff) "de Graaff"
* author[0] = Reference(Images-PractitionerRole-Pieterssen) "Pieterssen, Orthopedisch chirurg, Stichting Spaarne Gasthuis, Radiologie"
* author[1] = Reference(Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* custodian = Reference(Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:e5864703-93bd-46dc-9754-fcd2c0f16489" //document uniqueId | dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2020-03-03T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "2020-03-03" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].format = urn.oid.1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 //formatCode
// * content[0].attachment.title = "MRI" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "2020-03-03T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd
* content[0].attachment.url = "http://example.org/dicom-json/e5864703-93bd-46dc-9754-fcd2c0f16489" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* category.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* category.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code

Instance: Images-Patient-De-Graaff
InstanceOf: Patient
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* identifier.value = "120871737" // gegenereerd "fake" BSN
* name[0].text = "de Graaff"
* name[0].family = "de Graaff"
* gender = #unknown
* birthDate = "2008-01-01"

Instance: Images-PractitionerRole-Pieterssen
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(Images-Practitioner-Pieterssen) "Pieterssen"
* organization = Reference(Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: Images-Practitioner-Pieterssen
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "Pieterssen"
* name[0].family = "Pieterssen"

Instance: Images-Organization-Spaarne
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "Stichting Spaarne Gasthuis"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6010754"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"