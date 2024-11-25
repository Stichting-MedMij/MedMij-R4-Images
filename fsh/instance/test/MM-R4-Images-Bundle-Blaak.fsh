//DocumentReference voor beeld
Instance: MM-R4-Images-DocumentReference-Blaak-Beeld-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Blaak)
* author[0] = Reference(MM-R4-Images-PractitionerRole-De-Pater)
* author[1] = Reference(MM-R4-Images-Organization-OLVG)
* custodian = Reference(MM-R4-Images-Organization-OLVG)
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:7ce26098-1b2f-4ad8-bd45-d1e931e94ca0" //document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2024-05-23T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "2024-05-23" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].attachment.title = "Beelden Röntgen Clavicula rechts" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "2024-05-23T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd 
* content[0].attachment.url = "http://example.org/dicom/1" //URI | geen mapping naar dataset
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Reports" // Secundaire code

//DocumentReference voor verslag
Instance: MM-R4-Images-DocumentReference-Blaak-Verslag-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Blaak)
* author[0] = Reference(MM-R4-Images-PractitionerRole-De-Pater)
* author[1] = Reference(MM-R4-Images-Organization-OLVG)
* custodian = Reference(MM-R4-Images-Organization-OLVG)
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:b042e5cc-442d-4abd-840d-57f3c9f86f73" //document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2024-05-24T12:00:00Z" //date | Onderzoek.Verslaginformatie.DatumTijd
* context.period.start = "2024-05-23" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode
* content[0].attachment.title = "Rapport Röntgen Clavicula rechts" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.creation = "2024-05-24T12:00:00Z" //creationTime | Onderzoek.Verslaginformatie.DatumTijd 
* content[0].attachment.url = "http://example.org/report/1" //URI | geen mapping naar dataset
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code

Instance: MM-R4-Images-Patient-Blaak
InstanceOf: Patient
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* identifier.value = "19056436"
* name[0].text = "P.J. Blaak"
* name[0].family = "Blaak"
* name[0].given[0] = "P."
* name[0].given[1] = "J."
* gender = #male
* birthDate = "1996-04-23"

Instance: MM-R4-Images-PractitionerRole-De-Pater
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-De-Pater)
* organization = Reference(MM-R4-Images-Organization-OLVG)
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: MM-R4-Images-Practitioner-De-Pater
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "A.C.H. de Pater"
* name[0].family = "de Pater"
* name[0].given[0] = "A."
* name[0].given[1] = "C."
* name[0].given[2] = "H."

Instance: MM-R4-Images-Organization-OLVG
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "OLVG"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6010713"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"
* type.coding[1] = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis"