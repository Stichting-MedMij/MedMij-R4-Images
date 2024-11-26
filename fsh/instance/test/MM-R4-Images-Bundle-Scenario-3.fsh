//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 3

Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Image-3-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-De-Graaff) "de Graaff"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Pieterssen) "Pieterssen, Orthopedisch chirurg, Stichting Spaarne Gasthuis, Radiologie"
* author[1] = Reference(MM-R4-Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* custodian = Reference(MM-R4-Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:e5864703-93bd-46dc-9754-fcd2c0f16489" //document uniqueId | dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2020-03-03T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "2020-03-03" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
// * content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode | TO DO, welke moet dit zijn voor DICOM JSON?
// * content[0].attachment.title = "MRI" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "2020-03-03T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd
* content[0].attachment.url = "http://example.org/dicom-json/e5864703-93bd-46dc-9754-fcd2c0f16489" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code

Instance: MM-R4-Images-Patient-De-Graaff
InstanceOf: Patient
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* identifier.value = "120871737" // gegenereerd "fake" BSN
* name[0].text = "de Graaff"
* name[0].family = "de Graaff"
* gender = #unknown
* birthDate = "2008-01-01"

Instance: MM-R4-Images-PractitionerRole-Pieterssen
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-Pieterssen) "Pieterssen"
* organization = Reference(MM-R4-Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: MM-R4-Images-Practitioner-Pieterssen
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "Pieterssen"
* name[0].family = "Pieterssen"

Instance: MM-R4-Images-Organization-Spaarne
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "Stichting Spaarne Gasthuis"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6010754"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"