// FHIR test instances in FSH format for Image Availability test scenario 3

Instance: ImageAvailability-DocumentReference-De-Graaff-Image-3-1
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.225370106192817013781822914585593250010" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-De-Graaff) "de Graaff"
* date = "2020-03-03T12:00:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-PractitionerRole-Pieterssen) "Pieterssen, Orthopedisch chirurg"
* author[1] = Reference(ImageAvailability-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie, Algemeen ziekenhuis"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.826.0.1.3680043.8.498.90783674708684117220863480423356599801/series/2.25.293465249639799179250315041314515880819/instances/2.25.225370106192817013781822914585593250010" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MRI van linker bovenbeen" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2020-03-03T12:00:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#OT "Other Modality" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2020-03-03" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-De-Graaff) "de Graaff"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDSpaarneZiekenhuis
      * value = "RAD-20250212-47092" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-Spaarne) "Stichting Spaarne Gasthuis, Radiologie, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.826.0.1.3680043.8.498.90783674708684117220863480423356599801" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-Patient-De-Graaff
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient
Usage: #example
* identifier
  * system = $BSN
  * value.extension[http://hl7.org/fhir/StructureDefinition/data-absent-reason].valueCode = #masked // gemaskeerd BSN
* name[nameInformation]
  * use = #official
  * text = "de Graaff"
  * family = "de Graaff"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-prefix].valueString = "de"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Graaff"
* gender = #unknown
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = http://terminology.hl7.org/CodeSystem/v3-NullFlavor#UNK "Unknown"
* birthDate = "2008-01-01"

Instance: ImageAvailability-PractitionerRole-Pieterssen
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole
Usage: #example
* practitioner = Reference(ImageAvailability-Practitioner-Pieterssen) "Pieterssen"
* specialty[specialty] = $UZI#01.032 "Orthopedisch chirurg"

Instance: ImageAvailability-Practitioner-Pieterssen
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Pieterssen"
  * family = "Pieterssen"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Pieterssen"

Instance: ImageAvailability-Organization-Spaarne
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization
Usage: #example
* identifier
  * system = $AGB
  * value = "6010754"
* type[0] = $VektisAGB#0362 "Radiologie"
* type[1] = $OrganizationType#V6 "Algemeen ziekenhuis"
* name = "Stichting Spaarne Gasthuis"