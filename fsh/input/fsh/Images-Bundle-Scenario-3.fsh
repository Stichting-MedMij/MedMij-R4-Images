//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 3

Instance: Images-DocumentReference-Klaassen-Groen-Image-3-1
InstanceOf: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Usage: #example
* masterIdentifier
  * system = "urn:ietf:rfc:3986"
  * value = "urn:uuid:e5864703-93bd-46dc-9754-fcd2c0f16489" // document uniqueId | dummy UUID
* status = #current // availabilityStatus | geen mapping naar dataset
* type = http://snomed.info/sct#16831000087101 "MRI van linker bovenbeen" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[0] = http://loinc.org#18726-0 "Radiology studies (set)" // Primaire code
  * coding[1] = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES "Images" // Secundaire code
* subject = Reference(Images-Patient-De-Graaff) "de Graaff"
* date = "2020-03-03T12:00:00Z" // date | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(Images-PractitionerRole-Pieterssen) "Pieterssen, Orthopedisch chirurg, Stichting Spaarne Gasthuis, Radiologie"
* author[1] = Reference(Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie, Algemeen ziekenhuis"
* securityLabel = http://terminology.hl7.org/CodeSystem/v3-Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.xis/wado/metadata" // geen mapping naar dataset | verwijst naar een dummy URL op een PACS
    * title = "MRI van linker bovenbeen" // title | geen mapping naar dataset
    * creation = "2020-03-03T12:00:00Z" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = urn.oid:1.2.840.10008.2.6.1#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * period.start = "2020-03-03" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = http://snomed.info/sct#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(Images-Patient-De-Graaff) "de Graaff"
  * related
    * identifier
      * type.coding
        * system = "urn:ietf:rfc:3986"
        * code = #urn:ihe:iti:xds:2013:accession
      * system = "urn:oid:2.16.528.1.1023.19.1.1" // MedMij OID voor testdoeleinden Beeld in PGO
      * value = "RAD-20250212-47092" // Dummy Accession Number

Instance: Images-Patient-De-Graaff
InstanceOf: Patient
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/bsn"
  * value = "120871737" // gegenereerd "fake" BSN
* name
  * use = #official
  * text = "de Graaff"
  * family = "de Graaff"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "de"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Graaff"
* gender = #unknown
//  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"
* birthDate = "2008-01-01"

Instance: Images-PractitionerRole-Pieterssen
InstanceOf: PractitionerRole
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
* practitioner = Reference(Images-Practitioner-Pieterssen) "Pieterssen"
* organization = Reference(Images-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie, Algemeen ziekenhuis"
* specialty
  * coding = http://fhir.nl/fhir/NamingSystem/uzi-rolcode#01.032 "Orthopedisch chirurg"

Instance: Images-Practitioner-Pieterssen
InstanceOf: Practitioner
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
* name
  * use = #official
  * text = "Pieterssen"
  * family = "Pieterssen"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Pieterssen"

Instance: Images-Organization-Spaarne
InstanceOf: Organization
Usage: #example
* meta
  * profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/agb-z"
  * value = "6010754"
* type
  * coding[0] = urn:oid:2.16.840.1.113883.2.4.6.7#0362 "Radiologie"
  * coding[1] = http://nictiz.nl/fhir/NamingSystem/organization-type#V6 "Algemeen ziekenhuis"
* name = "Stichting Spaarne Gasthuis"