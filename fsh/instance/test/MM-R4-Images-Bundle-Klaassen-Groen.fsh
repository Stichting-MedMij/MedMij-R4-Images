//DocumentReference voor beeld 2.1
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Beeld-2-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Van-Der-Ham-2) "van der Ham, Orthopedisch chirurg, Erasmus MC, Radiologie, Universitair ziekenhuis"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie-Universitair) "Erasmus MC, Radiologie, Universitair ziekenhuis"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie-Universitair) "Erasmus MC, Radiologie, Universitair ziekenhuis"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:49b82e94-cf06-4507-b5a3-361d5937e77d" //document uniqueId | dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "1990-02-10T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "1990-02-10" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
// * content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode | TO DO, welke moet dit zijn voor DICOM JSON?
* content[0].attachment.title = "MRI" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "1990-02-10T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd
* content[0].attachment.url = "http://example.org/dicom-json/49b82e94-cf06-4507-b5a3-361d5937e77d" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code

//DocumentReference voor verslag 2.2
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Verslag-2-2
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Van-Der-Ham-1) "van der Ham, Orthopedisch chirurg, Erasmus MC, Radiologie"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:c4a902d3-1259-4881-9dd1-17376cef5ce5" //document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer| dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "1993-02-06T12:00:00Z" //date | Onderzoek.Verslaginformatie.DatumTijd
* context.period.start = "1993-02-06" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode
* content[0].attachment.title = "Rontgen Falanx L" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.creation = "1993-02-06T12:00:00Z" //creationTime | Onderzoek.Verslaginformatie.DatumTijd 
* content[0].attachment.url = "http://example.org/report/c4a902d3-1259-4881-9dd1-17376cef5ce5" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code

//DocumentReference voor beeld 2.3
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Beeld-2-3
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Janssen) "Janssen, Orthopedisch chirurg, Erasmus MC, Radiologie"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:57b49159-5c9e-424d-8a09-b240c13a395d" //document uniqueId | dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "1993-02-06T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "1993-02-06" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
// * content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode | TO DO, welke moet dit zijn voor DICOM JSON?
// * content[0].attachment.title = "MRI" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "1993-02-06T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd
* content[0].attachment.url = "http://example.org/dicom-json/57b49159-5c9e-424d-8a09-b240c13a395d" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code

//DocumentReference voor verslag 2.3
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Verslag-2-3
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Janssen) "Janssen, Orthopedisch chirurg, Erasmus MC, Radiologie"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:53338e45-a078-4886-8501-7cf1ec838afd" //document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer| dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "1993-02-06T12:00:00Z" //date | Onderzoek.Verslaginformatie.DatumTijd
* context.period.start = "1993-02-06" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode
// * content[0].attachment.title = "Rontgen Falanx L" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.creation = "1993-02-06T12:00:00Z" //creationTime | Onderzoek.Verslaginformatie.DatumTijd 
* content[0].attachment.url = "http://example.org/report/53338e45-a078-4886-8501-7cf1ec838afd" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code

//DocumentReference voor beeld 2.4
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Beeld-2-4
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Janssen) "C.H. Coenen, Kaakchirurg, Erasmus MC, Mondzorg en kaakchirurgie"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:d7236f3e-5c10-4caf-9864-255baa23611b" //document uniqueId | dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2020-08-10T12:00:00Z" //date | Onderzoek.Beeldinformatie.DatumTijd
* context.period.start = "2020-08-10" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
// * content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode | TO DO, welke moet dit zijn voor DICOM JSON?
// * content[0].attachment.title = "MRI" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/dicom+json
* content[0].attachment.creation = "2020-08-10T12:00:00Z" //creationTime | Onderzoek.Beeldinformatie.DatumTijd
* content[0].attachment.url = "http://example.org/dicom-json/d7236f3e-5c10-4caf-9864-255baa23611b" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code

//DocumentReference voor verslag 2.4
Instance: MM-R4-Images-DocumentReference-Klaassen-Groen-Verslag-2-4
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Minimal.DocumentReference
Usage: #example
* subject = Reference(MM-R4-Images-Patient-Klaassen-Groen) "José Klaassen-Groen"
* author[0] = Reference(MM-R4-Images-PractitionerRole-Janssen) "C.H. Coenen, Kaakchirurg, Erasmus MC, Mondzorg en kaakchirurgie"
* author[1] = Reference(MM-R4-Images-Organization-Erasmus-MC-Mondzorg) "Erasmus MC, Mondzorg en kaakchirurgie"
* custodian = Reference(MM-R4-Images-Organization-Erasmus-MC-Mondzorg) "Erasmus MC, Mondzorg en kaakchirurgie"
* masterIdentifier.system = "urn:ietf:rfc:3986"
* masterIdentifier.value = "urn:uuid:0a61a231-1b52-4ba5-b86c-9edac0bfa044" //document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer| dummy UUID
* status = #current //availabilityStatus | geen mapping naar dataset
* date = "2020-08-10T12:00:00Z" //date | Onderzoek.Verslaginformatie.DatumTijd
* context.period.start = "2020-08-10" //serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
* content[0].format = urn:oid:1.3.6.1.4.1.19376.1.2.7.1#urn.ihe.rad:PDF //formatCode
// * content[0].attachment.title = "Rontgen Falanx L" //title | geen mapping naar dataset
* content[0].attachment.contentType = #application/pdf
* content[0].attachment.creation = "2020-08-10T12:00:00Z" //creationTime | Onderzoek.Verslaginformatie.DatumTijd 
* content[0].attachment.url = "http://example.org/report/0a61a231-1b52-4ba5-b86c-9edac0bfa044" //URI | geen mapping naar dataset | dummy URL
* content[0].attachment.language = #nl //languageCode | geen mapping naar dataset
* type.coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
* type.coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code

Instance: MM-R4-Images-Patient-Klaassen-Groen
InstanceOf: Patient
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* identifier.value = "557807323" // gegenereerd "fake" BSN
* name[0].text = "José Klaassen-Groen"
* name[0].family = "Klaassen-Groen"
* name[0].given[0] = "José"
* gender = #female
* birthDate = "1924-01-10"

Instance: MM-R4-Images-PractitionerRole-Van-Der-Ham-1
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-Van-Der-Ham) "van der Ham"
* organization = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: MM-R4-Images-PractitionerRole-Van-Der-Ham-2
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-Van-Der-Ham) "van der Ham"
* organization = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie-Universitair) "Erasmus MC, Radiologie, Universitair ziekenhuis"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: MM-R4-Images-Practitioner-Van-Der-Ham
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "van der Ham"
* name[0].family = "van der Ham"

Instance: MM-R4-Images-PractitionerRole-Janssen
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-Janssen) "Janssen"
* organization = Reference(MM-R4-Images-Organization-Erasmus-MC-Radiologie) "Erasmus MC, Radiologie"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: MM-R4-Images-Practitioner-Janssen
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "Janssen"
* name[0].family = "Janssen"

Instance: MM-R4-Images-PractitionerRole-Coenen
InstanceOf: PractitionerRole
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(MM-R4-Images-Practitioner-Coenen) "C.H. Coenen"
* organization = Reference(MM-R4-Images-Organization-Erasmus-MC-Mondzorg) "Erasmus MC, Mondzorg en kaakchirurgie"
* specialty.coding[0] = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#02.054 "Kaakchirurg"

Instance: MM-R4-Images-Practitioner-Coenen
InstanceOf: Practitioner
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name[0].text = "C.H. Coenen"
* name[0].family = "Coenen"
* name[0].given[0] = "C."
* name[0].given[1] = "H."

Instance: MM-R4-Images-Organization-Erasmus-MC-Radiologie-Universitair
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "Erasmus MC"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6020806"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"
* type.coding[1] = http://nictiz.nl/fhir/NamingSystem/organization-type#V5 "Universitair ziekenhuis"

Instance: MM-R4-Images-Organization-Erasmus-MC-Radiologie
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "Erasmus MC"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6020806"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"

Instance: MM-R4-Images-Organization-Erasmus-MC-Mondzorg
InstanceOf: Organization
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* name = "Erasmus MC"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/agb-z"
* identifier.value = "6020806"
* type.coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#1101 "Mondzorg en kaakchirurgie, implantoloog"