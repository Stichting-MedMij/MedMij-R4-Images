//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 5

Instance: Images-DocumentReference-XXX-Aansluittest-B-Image-5-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:b7e5d9e2-9e5f-4df6-bc0f-9f98b6d4c705" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#113091000 "MRI" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2024-08-07T11:57:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Cardioloog) "Cardioloog, Catharina Ziekenhuis Eindhoven, Radiotherapie"
* author[1] = Reference(Images-Organization-CZE-Radiotherapie) "Catharina Ziekenhuis Eindhoven, Radiotherapie"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/studies/2.16.840.1.114493.1.4.270.3.20240807115710430/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "MedMij PGO test MR" // title | geen mapping naar dataset
    * creation = "2024-08-07T11:57:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2024-08-07" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "EXT-14115" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "2.16.840.1.114493.1.4.270.3.20240807115710430" // Dummy Study Instance UID

Instance: Images-DocumentReference-XXX-Aansluittest-B-Image-5-2
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:a013c0cf-d4f9-4bc5-aa76-ac41347454bd" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#77477000 "CT" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2024-08-22T16:45:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Cardioloog) "Cardioloog, Catharina Ziekenhuis Eindhoven, Radiotherapie"
* author[1] = Reference(Images-Organization-CZE-Radiotherapie) "Catharina Ziekenhuis Eindhoven, Radiotherapie"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/studies/1.3.12.2.1107.5.1.7.130290.30000024082216430327200000003/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "MedMij PGO test CT" // title | geen mapping naar dataset
    * creation = "2024-08-22T16:45:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2024-08-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "EXT-14117" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.3.12.2.1107.5.1.7.130290.30000024082216430327200000003" // Dummy Study Instance UID

Instance: Images-DocumentReference-XXX-Aansluittest-B-Image-5-3
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:14206553-b245-4f16-bd9b-78e3b667d879" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#77477000 "CT" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-01-17T08:44:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Cardioloog) "Cardioloog, Catharina Ziekenhuis Eindhoven, Radiotherapie"
* author[1] = Reference(Images-Organization-CZE-Radiotherapie) "Catharina Ziekenhuis Eindhoven, Radiotherapie"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/studies/1.3.12.2.1107.5.1.7.130290.30000025011708292397300000003/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "MedMij PGO CT" // title | geen mapping naar dataset
    * creation = "2025-01-17T08:44:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-01-17" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "EXT-14114" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.3.12.2.1107.5.1.7.130290.30000025011708292397300000003" // Dummy Study Instance UID

Instance: Images-DocumentReference-XXX-Aansluittest-B-Image-5-4
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:68dc993f-5430-4344-aa9b-a9ba3d9ff099" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#44491008 "röntgendoorlichting" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T13:56:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Huisarts) "Huisarts, Catharina Ziekenhuis Eindhoven"
* author[1] = Reference(Images-Organization-CZE) "Catharina Ziekenhuis Eindhoven"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/studies/1.2.752.24.7.3059655634.36524/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "RF Slikfoto's MedMij" // title | geen mapping naar dataset
    * creation = "2025-02-25T13:56:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "5003249217" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.2.752.24.7.3059655634.36524" // Dummy Study Instance UID

Instance: Images-DocumentReference-XXX-Aansluittest-B-Report-5-4
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:b72d10a7-ca14-4c54-9711-fc4241c5d840" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#44491008 "röntgendoorlichting" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T14:24:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Huisarts) "Huisarts, Catharina Ziekenhuis Eindhoven"
* author[1] = Reference(Images-Organization-CZE) "Catharina Ziekenhuis Eindhoven"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/pdf
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "Binary/Images-Binary-Report-5-4" // geen mapping naar dataset | verwijst naar een Binary
    * title = "RF Slikfoto's MedMij" // title | geen mapping naar dataset
    * creation = "2025-02-25T14:24:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn.ihe.rad:PDF // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "5003249217" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.2.752.24.7.3059655634.36524" // Dummy Study Instance UID

Instance: Images-Binary-Report-5-4
InstanceOf: Binary
Usage: #example
* contentType = #application/pdf
* data = "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" // Voorbeeldverslag in PDF

Instance: Images-DocumentReference-XXX-Aansluittest-B-Image-5-5
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:63bab3df-700c-4640-906c-b75e5d028437" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#44491008 "röntgendoorlichting" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T13:53:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Huisarts) "Huisarts, Catharina Ziekenhuis Eindhoven"
* author[1] = Reference(Images-Organization-CZE) "Catharina Ziekenhuis Eindhoven"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/studies/1.2.752.24.7.3059655634.36522/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "CR CWK MedMij" // title | geen mapping naar dataset
    * creation = "2025-02-25T13:53:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "5003249215" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.2.752.24.7.3059655634.36522" // Dummy Study Instance UID

Instance: Images-DocumentReference-XXX-Aansluittest-B-Report-5-5
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:cc9008c2-8a08-457e-a928-c42d43b1efb7" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#44491008 "röntgendoorlichting" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS "Reports" // Secundaire code
* subject = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T14:07:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Huisarts) "Huisarts, Catharina Ziekenhuis Eindhoven"
* author[1] = Reference(Images-Organization-CZE) "Catharina Ziekenhuis Eindhoven"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/pdf
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "Binary/Images-Binary-Report-5-5" // geen mapping naar dataset | verwijst naar een Binary
    * title = "CR CWK MedMij" // title | geen mapping naar dataset
    * creation = "2025-02-25T14:07:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = http://ihe.net/fhir/ihe.formatcode.fhir/CodeSystem/formatcode#urn.ihe.rad:PDF // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "5003249215" // Dummy Accession Number
  * related[1]
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2016:studyInstanceUID
      * value = "1.2.752.24.7.3059655634.36522" // Dummy Study Instance UID

Instance: Images-Binary-Report-5-5
InstanceOf: Binary
Usage: #example
* contentType = #application/pdf
* data = "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" // Voorbeeldverslag in PDF

Instance: Images-Patient-XXX-Aansluittest-B
InstanceOf: Patient
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/bsn"
  * value = "999990019" // gegenereerd "fake" BSN
* name
  * use = #official
  * text = "B. XXX-Aansluittest-B"
  * family = "XXX-Aansluittest-B"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "XXX-Aansluittest-B"
  * given = "B."
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #IN
* gender = #female
//  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-AdministrativeGender#F "Female"
* birthDate = "1950-02-02"

Instance: Images-PractitionerRole-Cardioloog
InstanceOf: PractitionerRole
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* organization = Reference(Images-Organization-CZE-Radiotherapie) "Catharina Ziekenhuis Eindhoven, Radiotherapie"
* specialty
  * coding = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.010 "Cardioloog"

Instance: Images-PractitionerRole-Huisarts
InstanceOf: PractitionerRole
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* organization = Reference(Images-Organization-CZE) "Catharina Ziekenhuis Eindhoven"
* specialty
  * coding = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.015 "Huisarts"

Instance: Images-Organization-CZE-Radiotherapie
InstanceOf: Organization
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/agb-z"
  * value = "06011009"
* type
  * coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0361 "Radiotherapie"
  * coding[1] = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis"
* name = "Catharina Ziekenhuis Eindhoven"

Instance: Images-Organization-CZE
InstanceOf: Organization
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/agb-z"
  * value = "06011009"
* type
  * coding = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis"
* name = "Catharina Ziekenhuis Eindhoven"