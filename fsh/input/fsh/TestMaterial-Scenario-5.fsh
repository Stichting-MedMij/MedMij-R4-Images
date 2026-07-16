// FHIR test instances in FSH format for Image Availability test scenario 5

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-1
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.98685467489423581429980749441050035880" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2024-08-22T16:45:42+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Janssen-CZE) "Janssen"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.3.12.2.1107.5.1.7.130290.30000024082216430327200000003/series/2.25.62435657674771067210271088065092768055/instances/2.25.98685467489423581429980749441050035880" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MedMij PGO test CT" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2024-08-22T16:45:42+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CT "Computed Tomography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2024-08-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "EXT-14117" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.3.12.2.1107.5.1.7.130290.30000024082216430327200000003" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-2
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.98689969643066273416183602755420758806" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-01-17T08:44:35+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Janssen-CZE) "Janssen"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.3.12.2.1107.5.1.7.130290.30000025011708292397300000003/series/2.25.155401871976277323518300317632862814864/instances/2.25.98689969643066273416183602755420758806" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MedMij PGO CT" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-01-17T08:44:35+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CT "Computed Tomography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-01-17" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "EXT-14114" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.3.12.2.1107.5.1.7.130290.30000025011708292397300000003" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-3
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.5736788717031364046150233872058022718" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "CR Bekken + heup(en)" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T13:53:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Van-Den-Berg-CZE) "v.d. Berg"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.752.24.7.3059655634.36522/series/2.25.327109396484713206896779734146872144676/instances/2.25.5736788717031364046150233872058022718" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "CR CWK MedMij" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-02-25T13:53:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality][0] = $DCM#OT "Other Modality" // Onderzoek.Beeldinformatie.Modaliteit
  * event[modality][1] = $DCM#CR "Computed Radiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003249215" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.36522" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Report-5-3
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $URI
  * value = "urn:uuid:cc9008c2-8a08-457e-a928-c42d43b1efb7" // document uniqueId | Onderzoek.Verslaginformatie.VerslaginformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "CR Bekken + heup(en)" // Procedure Code Sequence > Code Meaning
* category
  * coding[reports] = $XDSClassCode#REPORTS "Reports" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-25T14:07:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Van-Den-Berg-CZE) "v.d. Berg"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/pdf
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "Binary/ImageAvailability-Binary-Report-5-3" // geen mapping naar dataset | verwijst naar een Binary
    * title = "CR CWK MedMij" // title | Onderzoek.Verslaginformatie.VerslagTitel
    * creation = "2025-02-25T14:07:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $FormatCode#urn:ihe:rad:PDF // formatCode | geen mapping naar dataset
* context
  * period.start = "2025-02-25" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003249215" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.36522" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-Binary-Report-5-3
InstanceOf: Binary
Usage: #example
* contentType = #application/pdf
* data = "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" // Voorbeeldverslag in PDF

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-4
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.150606558103072029784566806744418491720" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "CR THORAX" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-02T08:36:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Bakker-AUMC) "Bart Bakker"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.309496748046569320805636965993460666632/series/2.25.195433058229186809480367734543916316743/instances/2.25.150606558103072029784566806744418491720" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "CR Thorax" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-02T08:36:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#DX "Digital Radiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-02" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000173699" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.309496748046569320805636965993460666632" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-5
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.150599066413166673819115182759068623778" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $SCT#386831001 "gastroscopie" // Onderzoek.Verrichting.VerrichtingType | use the SNOMED CT display name of the procedure code sequence in (0008,1032)
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2017-04-14T17:54:20+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Willems-CZE) "Thomas Hugo Willems"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.276.0.50.10201000171.1821207.15297928.15756/series/2.25.828214698350840955484898921792912694/instances/2.25.150599066413166673819115182759068623778" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "ENDOSCOPIE-KAMER 5" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2017-04-14T17:54:20+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#ES "Endoscopy" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2017-04-14" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "V-24031" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.276.0.50.10201000171.1821207.15297928.15756" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-6
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.299189956795323170040878896967724638182" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $SCT#89846007 "orthopantomografie" // Onderzoek.Verrichting.VerrichtingType | tag (0008,1032) afwezig
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2022-11-04T10:27:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-El-Hasnaoui-AUMC) "dr. El Hasnaoui"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.840.114350.2.408.2.798268.2.195735974.1/series/2.25.323702012275538077411012975373843146745/instances/2.25.299189956795323170040878896967724638182" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MKA OPG" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2022-11-04T10:27:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CR "Computed Radiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2022-11-04" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000173980" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.840.114350.2.408.2.798268.2.195735974.1" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-7
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.248079036533563831387504106862601127541" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-05T10:56:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Smit-AUMC) "Prof. Smit"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.69733758576694720070492648219173934289/series/2.25.242760769491036901522158779432493781289/instances/2.25.248079036533563831387504106862601127541" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "HARTKATHERISATIE PROCEDURE" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-02-05T10:56:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#XA "X-Ray Angiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-02-05" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000161857" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.69733758576694720070492648219173934289" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-8
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.220898900706959638015881319843209781157" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "CT van thorax" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-05T11:00:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Bakker-AUMC) "Bart Bakker"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.138837531083422306522668993373321653689/series/2.25.270619276528496920951032352575495403911/instances/2.25.220898900706959638015881319843209781157" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "CT THORAX ZONDER CONTRAST" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-02-05T11:00:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CT "Computed Tomography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-02-05" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000161858" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.138837531083422306522668993373321653689" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-9
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.233721447186178566629253945530832235048" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "echografie van thorax" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-02-05T11:04:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Smit-AUMC) "Prof. Smit"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.178957074549929243218633389655900449143/series/2.25.133607736876396318990498262516943986643/instances/2.25.233721447186178566629253945530832235048" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "TTE - TRANSTHORACALE ECHO" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-02-05T11:04:00+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#US "Ultrasound" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-02-05" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000161860" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.178957074549929243218633389655900449143" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-10
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.95966818745833947741618595219711037190" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "MG MAMMOGRAFIE" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-02T15:50:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Visser-AUMC) "N. Visser"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.122947418999141105980865839639187651261/series/2.25.323146501594166118692321542834534350905/instances/2.25.95966818745833947741618595219711037190" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MG MAMMOGRAFIE" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-02T15:50:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#MG "Mammography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-02" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000173698" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.122947418999141105980865839639187651261" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-11
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.307449147627356852524957366186549952381" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-02T08:02:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-De-Wit-AUMC) "R.J. de Wit"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.68247088999053756731944807439344102682/series/2.25.190154591464996163805893070239744947839/instances/2.25.307449147627356852524957366186549952381" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MRI WERVELKOLOM" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-02T08:02:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#MR "Magnetic Resonance" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-02" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000173701" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.68247088999053756731944807439344102682" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-12
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.175209346284073273900540986423954919243" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-11T09:35:30+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-Smit-AUMC) "Prof. Smit"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/9.25.17032597195948003129503533750762258202/series/2.25.309460615655030623753206898257276436897/instances/2.25.175209346284073273900540986423954919243" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "CARDIALE - IMPORT" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-11T09:35:30+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#ECG "Electrocardiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-11" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AL99250911093530" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:9.25.17032597195948003129503533750762258202" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-13
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.330111262929410421071085714147237434458" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2011-01-01T14:06:06+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* author[1] = Reference(ImageAvailability-Practitioner-De-Wit-AUMC) "R.J. de Wit"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.3.46.670589.11.1.5.0.6560.2011072814060507000/series/2.25.161282779865325765090434193997200815530/instances/2.25.330111262929410421071085714147237434458" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "dS Knee 16ch, T1W, 3D Wats, PDW, PDW SPAIR" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2011-01-01T14:06:06+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#MR "Magnetic Resonance" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2011-01-01" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "JUGFIKYUGJ" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.3.46.670589.11.1.5.0.6560.2011072814060507000" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-14
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.8155354506839150953620648368106652370" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2006-12-19T11:11:54+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.3.6.1.4.1.5962.1.2.10.1166562673.14401/series/2.25.74124144285881267481009363901553308280/instances/2.25.8155354506839150953620648368106652370" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * creation = "2006-12-19T11:11:54+01:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CT "Computed Tomography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2006-12-19" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "0010" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.3.6.1.4.1.5962.1.2.10.1166562673.14401" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-15
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.116761086889095445112420115394215297755" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "MG Mammadiagnostiek poli controle" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-22T14:08:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Vermeulen-CZE) "M. Vermeulen"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.752.24.7.3059655634.38679/series/2.25.64610254706112505877700170291725645778/instances/2.25.116761086889095445112420115394215297755" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MG Mammadiagnostiek poli nieuw" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-22T14:08:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#MG "Mammography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003464504" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.38679" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-16
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.294345119309672963947070671061734905689" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "RF Slikfoto's" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-22T14:13:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-De-Groot-CZE) "De Groot"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.752.24.7.3059655634.38682/series/2.25.109803258301112139902786026585121598428/instances/2.25.294345119309672963947070671061734905689" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "RF Slikfoto's" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-22T14:13:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#RF "Radiofluoroscopy" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003464515" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.38682" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-17
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.337427242843909492698887129236242906414" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "MRI Kleine bekken" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-22T14:11:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Peters-CZE) "Drs. Peters"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.752.24.7.3059655634.38681/series/2.25.53816663829293364096282132029358647592/instances/2.25.337427242843909492698887129236242906414" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "MRI Kleine bekken" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-22T14:11:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#MR "Magnetic Resonance" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003464511" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.38681" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-18
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.110504336777711299355968964491341709663" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type
  * coding = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
  * text = "CR Pols links" // Procedure Code Sequence > Code Meaning
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-22T14:06:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author[0] = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis"
* author[1] = Reference(ImageAvailability-Practitioner-Van-Den-Berg-CZE) "v.d. Berg"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.752.24.7.3059655634.38678/series/2.25.230575252117478056186092211520176569618/instances/2.25.110504336777711299355968964491341709663" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "CR Pols links" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-22T14:06:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#CR "Computed Radiography" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-22" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V6 "Algemeen ziekenhuis" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDCZE
      * value = "5003464501" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-CZE) "Catharina Ziekenhuis Eindhoven, Algemeen ziekenhuis" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.752.24.7.3059655634.38678" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-DocumentReference-XXX-AansluittestB-Image-5-19
InstanceOf: http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference
Usage: #example
* masterIdentifier
  * system = $DICOMUniqueId
  * value = "urn:oid:2.25.234021917970851461164617206999255728356" // document uniqueId | Onderzoek.Beeldinformatie.BeeldinformatieIdentificatienummer
* status = #current // availabilityStatus | geen mapping naar dataset
* type = $NullFlavor#OTH "Other" // Onderzoek.Verrichting.VerrichtingType
* category
  * coding[images] = $XDSClassCode#IMAGES "Images" // classCode
* subject = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
* date = "2025-09-02T08:07:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
* author = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum"
* securityLabel = $Confidentiality#N "Normal" // securityLabel | geen mapping naar dataset
* content
  * attachment
    * contentType = #application/dicom+json
    * language = #nl // languageCode | geen mapping naar dataset
    * url = "https://examplepacs.example.com/wado/studies/1.2.40.0.13.1.36321563540218036552979854024549596684/series/2.25.166828643325596231880745342925117718422/instances/2.25.234021917970851461164617206999255728356" // [dummy url]/studies/[StudyInstanceUID]/series/[SeriesInstanceUID]/instances/[SOPInstanceUID]
    * title = "REVA BEWEGINGSLAB INSPANNINGSTEST RAPPORT" // title | Onderzoek.Beeldinformatie.BeeldTitel
    * creation = "2025-09-02T08:07:00+02:00" // creationTime | Onderzoek.Beeldinformatie.DatumTijd
  * format = $DCMUID#1.2.840.10008.5.1.4.1.1.88.59 // formatCode | geen mapping naar dataset
* context
  * event[modality] = $DCM#SR "Structured Report Document" // Onderzoek.Beeldinformatie.Modaliteit
  * period.start = "2025-09-02" // serviceStartTime | Onderzoek.Verrichting.VerrrichtingStartdatum
  * facilityType = $OrganizationType#V5 "Universitair Medisch Centrum" // Zorgaanbieder.OrganisatieType
  * practiceSetting = $SCT#394734003 "Radiological specialties" // Overgenomen uit de Nictiz IG, moet mogelijk specifieker
  * sourcePatientInfo = Reference(ImageAvailability-Patient-XXX-Aansluittest-B) "B. XXX-Aansluittest-B"
  * related[0]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2013:accession
      * system = $OIDAUMC
      * value = "AGFA00000173700" // Onderzoek.AccessionNumberInformatie.AccessionNumber
      * assigner = Reference(ImageAvailability-Organization-AUMC) "Amsterdam UMC, Universitair Medisch Centrum" // Onderzoek.AccessionNumberInformatie.UitgevendeInstantie
  * related[1]
    * identifier
      * type = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system = $DICOMUniqueId
      * value = "urn:oid:1.2.40.0.13.1.36321563540218036552979854024549596684" // Onderzoek.StudyInstanceUID

Instance: ImageAvailability-Patient-XXX-Aansluittest-B
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient
Usage: #example
* identifier
  * system = $BSN
  * value.extension[http://hl7.org/fhir/StructureDefinition/data-absent-reason].valueCode = #masked // gemaskeerd BSN
* name[nameInformation]
  * use = #official
  * text = "B. XXX-Aansluittest-B"
  * family = "XXX-Aansluittest-B"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "XXX-Aansluittest-B"
  * given = "B."
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #IN
* gender = #female
  * extension[http://nictiz.nl/fhir/StructureDefinition/ext-CodeSpecification].valueCodeableConcept.coding = $AdministrativeGender#F "Female"
* birthDate = "1950-02-02"

Instance: ImageAvailability-Practitioner-Janssen-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Janssen"

Instance: ImageAvailability-Practitioner-Van-Den-Berg-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "v.d. Berg"

Instance: ImageAvailability-Practitioner-Vermeulen-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "M. Vermeulen"

Instance: ImageAvailability-Practitioner-De-Groot-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "De Groot"

Instance: ImageAvailability-Practitioner-Peters-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Drs. Peters"

Instance: ImageAvailability-Practitioner-Willems-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Thomas Hugo Willems"

Instance: ImageAvailability-Practitioner-Bakker-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Bart Bakker"

Instance: ImageAvailability-Practitioner-El-Hasnaoui-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "dr. El Hasnaoui"

Instance: ImageAvailability-Practitioner-Smit-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "Prof. Smit"

Instance: ImageAvailability-Practitioner-Visser-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "N. Visser"

Instance: ImageAvailability-Practitioner-De-Wit-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner
Usage: #example
* name[nameInformation]
  * use = #official
  * text = "R.J. de Wit"

Instance: ImageAvailability-Organization-CZE
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization
Usage: #example
* identifier
  * system = $AGB
  * value = "06011009"
* type = $OrganizationType#V6 "Algemeen ziekenhuis"
* name = "Catharina Ziekenhuis Eindhoven"

Instance: ImageAvailability-Organization-AUMC
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization
Usage: #example
* identifier
  * system = $AGB
  * value = "06020701"
* type = $OrganizationType#V5 "Universitair Medisch Centrum"
* name = "Amsterdam UMC"