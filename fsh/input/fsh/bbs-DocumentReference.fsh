//Profile on DocumentReference derived from IHE MHD to be used in Beeldbeschikbaarheid

Profile: BbsDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference
Id: bbs-DocumentReference
Title: "bbs DocumentReference"
Description: "Imaging research including images and reports."
* ^status = #draft
* ^publisher = "MedMij"
* ^purpose = "This DocumentReference resource represents the Onderzoek building block for patient use cases in the context of the information standard [Beeldbeschikbaarheid](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid). This profile is based on the [IHE.MHD.Comprehensive.DocumentReference profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.Comprehensive.DocumentReference)."
* ^copyright = "Copyright and related rights waived via CC0, https://creativecommons.org/publicdomain/zero/1.0/. This does not apply to information from third parties, for example a medical terminology system. The implementer alone is responsible for identifying and obtaining any necessary licenses or authorizations to utilize third party IP in connection with the specification or otherwise."
* ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
* ^mapping[0].uri = "https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html"
* ^mapping[0].name = "ART-DECOR Dataset BBS 1.0.0-alpha.2 20240208"
* ^mapping[1].identity = "ihexds-dataset-2024-20220712"
* ^mapping[1].uri = "https://decor.nictiz.nl/pub/nihemds/ihexds-html-20220712T144728/ds-2.16.840.1.113883.2.4.3.11.60.106.1.1-2013-12-04T122419.html"
* ^mapping[1].name = "ART-DECOR Dataset Nationale IHE MetaData Set (2024)"
* . 
  * ^short = "ImagingResearch"
  * ^definition = "Imaging research including images and reports."
  * ^alias = "Onderzoek"
  * ^mapping.identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping.map = "bbs-dataelement-66"
  * ^mapping.comment = "ImagingResearch"
* masterIdentifier
  * ^short = "ReportInformationIdentificationNumber / ImageInformationIdentificationNumber / UniqueID"
  * ^definition = """
      * Globally unique ID for the report of the imaging research. In DICOM the study/series UID can be used.
      * Globally unique ID that describes the set of images. In DICOM the study/series UID can be used.
      * The globally unique identifier assigned by the document creator to this document.
    """
  * ^alias[0] = "VerslaginformatieIdentificatienummer"
  * ^alias[1] = "BeeldinformatieIdentificatienummer"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-100"
  * ^mapping[0].comment = "ReportInformationIdentificationNumber"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-784"
  * ^mapping[0].comment = "ImageInformationIdentificationNumber"
  * ^mapping[2].identity = "ihexds-dataset-2024-20220712"
  * ^mapping[2].map = "ihexds-dataelement-29"
  * ^mapping[2].comment = "uniqueID"
* status
  * ^short = "AvailabilityStatus"
  * ^definition = "The lifecycle status of the document."
  * ^patternCode = #current
  * ^mapping.identity = "ihexds-dataset-2024-20220712"
  * ^mapping.map = "ihexds-dataelement-3"
  * ^mapping.comment = "availabilityStatus"
* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.14.1.2--20200901000000 (extensible)
  * ^short = "ProcedureType / TypeCode"
  * ^definition = """
      * Description of the procedure and/or the performed imaging research (e.g. CT thorax, MRI knee, ultrasonography of breast, X-ray).
      * The code specifying the precise kind of document (e.g. Pulmonary History and Physical, Discharge Summary, Ultrasound Report).
    """
  * ^alias = "VerrichtingType"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-176"
  * ^mapping[0].comment = "ProcedureType"
  * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
  * ^mapping[1].map = "ihexds-dataelement-28"
  * ^mapping[1].comment = "typeCode"
* category
  * ^short = "ClassCode"
  * ^definition = "The code specifying the particular kind of document."
  * ^mapping.identity = "ihexds-dataset-2024-20220712"
  * ^mapping.map = "ihexds-dataelement-9"
  * ^mapping.comment = "classCode"
* category.coding 2..*
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "$this"
  * ^slicing.rules = #open
* category.coding contains
    radiologyStudies 1..1 and
    images 0..1 and
    reports 0..1
* category.coding[radiologyStudies] ^patternCoding = http://loinc.org#18726-0
* category.coding[images] 
  * ^patternCoding = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#IMAGES
  * ^condition = "bbs-DocumentReference-1"
* category.coding[reports]
  * ^patternCoding = urn:oid:1.3.6.1.4.1.19376.1.2.6.1#REPORTS
  * ^condition = "bbs-DocumentReference-1"
* category.coding obeys bbs-DocumentReference-1
* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^short = "Patient / PatientId"
  * ^alias = "Patient"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-132"
  * ^mapping[0].comment = "Patient"
  * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
  * ^mapping[1].map = "ihexds-dataelement-19"
  * ^mapping[1].comment = "patientId"
* date
  * ^short = "DateTime"
  * ^definition = """
        * Date/time on which the report has been autorised and/or made available.
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made.
        """
  * ^alias = "DatumTijd"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-101"
  * ^mapping[0].comment = "DateTime"
  * ^mapping[1].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[1].map = "bbs-dataelement-69"
  * ^mapping[1].comment = "DateTime"
* author only Reference(Practitioner or PractitionerRole or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
  * ^short = "Performer / Location / Author"
  * ^alias[0] = "Uitvoerder"
  * ^alias[1] = "Locatie"
  * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[0].map = "bbs-dataelement-187"
  * ^mapping[0].comment = "Performer"
  * ^mapping[1].identity = "bbs-dataset-100-alpha2-20240208"
  * ^mapping[1].map = "bbs-dataelement-185"
  * ^mapping[1].comment = "Location"
  * ^mapping[2].identity = "ihexds-dataset-2024-20220712"
  * ^mapping[2].map = "ihexds-dataelement-2"
  * ^mapping[2].comment = "author"
* authenticator only Reference(Practitioner or PractitionerRole or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
  * ^short = "LegalAuthenticator"
  * ^definition = "Represents a participant who has legally authenticated or attested the document within the author institution."
  * ^mapping.identity = "ihexds-dataset-2024-20220712"
  * ^mapping.map = "ihexds-dataelement-17"
  * ^mapping.comment = "legalAuthenticator"
* description
  * ^short = "Comments"
  * ^definition = "Comments associated with the document."
  * ^mapping.identity = "ihexds-dataset-2024-20220712"
  * ^mapping.map = "ihexds-dataelement-4"
  * ^mapping.comment = "comments"
* securityLabel from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.6--20131212104106 (extensible)
  * ^short = "ConfidentialityCode"
  * ^definition = "The code specifying the level of confidentiality of the document."
  * ^mapping.identity = "ihexds-dataset-2024-20220712"
  * ^mapping.map = "ihexds-dataelement-10"
  * ^mapping.comment = "confidentialityCode"
* content
  * attachment
    * contentType
      * ^short = "MimeType"
      * ^definition = "MIME type of the document."
      * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[purpose].valueCode = #minimum
      * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[valueSet].valueCanonical = "http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.8--20131212104106"
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-18"
      * ^mapping.comment = "mimeType"
    * language
      * ^short = "LanguageCode"
      * ^definition = "Specifies the human language of character data in the document. Using codes from IETF RFC 3066."
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-16"
      * ^mapping.comment = "languageCode"
    * url
      * ^short = "URI"
      * ^definition = "The URI for the document."
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-30"
      * ^mapping.comment = "URI"
    * size
      * ^short = "Size"
      * ^definition = "Size in bytes of the document."
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-24"
      * ^mapping.comment = "size"
    * hash
      * ^short = "Hash"
      * ^definition = "Hash of the document itself."
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-14"
      * ^mapping.comment = "hash"
    * title
      * ^short = "Title"
      * ^definition = "The title of the document."
      * ^mapping.identity = "ihexds-dataset-2024-20220712"
      * ^mapping.map = "ihexds-dataelement-27"
      * ^mapping.comment = "title"
    * creation
      * ^short = "DateTime / CreationTime"
      * ^definition = """
        * Date/time on which the report has been autorised and/or made available.
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made.
        * The time the author created the document. Shall have a single value.
        """
      * ^alias = "DatumTijd"
      * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
      * ^mapping[0].map = "bbs-dataelement-101"
      * ^mapping[0].comment = "DateTime"
      * ^mapping[1].identity = "bbs-dataset-100-alpha2-20240208"
      * ^mapping[1].map = "bbs-dataelement-69"
      * ^mapping[1].comment = "DateTime"
      * ^mapping[2].identity = "ihexds-dataset-2024-20220712"
      * ^mapping[2].map = "ihexds-dataelement-11"
      * ^mapping[2].comment = "creationTime"
  * format from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.7--20131212104106 (extensible)
    * ^short = "FormatCode"
    * ^definition = "Code globally uniquely specifying the format of the document."
    * ^mapping.identity = "ihexds-dataset-2024-20220712"
    * ^mapping.map = "ihexds-dataelement-13"
    * ^mapping.comment = "formatCode"
* context
  * encounter only Reference(Encounter or EpisodeOfCare or http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter)
    * ^short = "ReferenceIdList"
    * ^definition = "A list of identifiers that apply to the document. Identifiers may be Accession Numbers, Order Numbers, Referral Request Identifiers, XDS Workflow Instance Identifiers, etc."
    * ^comment = "Only Encounters on the ReferenceIdList are conveyed here, while other identifiers on that list are conveyed via `.context.related`."
    * ^mapping.identity = "ihexds-dataset-2024-20220712"
    * ^mapping.map = "ihexds-dataelement-117"
    * ^mapping.comment = "referenceIdList"
  * event
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^short = "EventCodeList"
    * ^definition = "This list of codes represents the main clinical acts, such as a colonoscopy or an appendectomy, being documented."
    * ^mapping.identity = "ihexds-dataset-2024-20220712"
    * ^mapping.map = "ihexds-dataelement-12"
    * ^mapping.comment = "eventCodeList"
  * event contains procedureAnatomicalLocation 0..1
  * event[procedureAnatomicalLocation] only http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
  * event[procedureAnatomicalLocation] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.19--20240205123345 (required)
    * ^short = "ProcedureAnatomicalLocation / Location"
    * ^definition = """
      Anatomical location which is the focus of the procedure.

      The value set is proposed by IHE MCWG and also suggested for the EU (Xt-EHR). The used value set is a subset of the value set defined in zib2020.
      """
    * ^alias[0] = "VerrichtingAnatomischeLocatie"
    * ^alias[1] = "Locatie"
    * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
    * ^mapping[0].map = "bbs-dataelement-178"
    * ^mapping[0].comment = "ProcedureAnatomicalLocation"
    * ^mapping[1].identity = "bbs-dataset-100-alpha2-20240208"
    * ^mapping[1].map = "bbs-dataelement-179"
    * ^mapping[1].comment = "Location"
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality].valueCodeableConcept
      * ^mapping.identity = "bbs-dataset-100-alpha2-20240208"
      * ^mapping.map = "bbs-dataelement-180"
      * ^mapping.comment = "Laterality"
  * period
    * start
      * ^short = "ProcedureStartDate / ServiceStartTime"
      * ^definition = """
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made. In practice the time is the instance on which the first image has been taken.
        * The start time the service being documented took place.
        """
      * ^alias = "VerrichtingStartDatum"
      * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
      * ^mapping[0].map = "bbs-dataelement-174"
      * ^mapping[0].comment = "ProcedureStartDate"
      * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
      * ^mapping[1].map = "ihexds-dataelement-22"
      * ^mapping[1].comment = "serviceStartTime"
    * end
      * ^short = "ProcedureEndDate / ServiceStopTime"
      * ^definition = """
        * The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted.
        The element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty. For instantaneous or very short lasting procedures the element is omitted. 
        * The stop time the service being documented took place.
        """
      * ^alias = "VerrichtingEindDatum"
      * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
      * ^mapping[0].map = "bbs-dataelement-175"
      * ^mapping[0].comment = "ProcedureEndDate"
      * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
      * ^mapping[1].map = "ihexds-dataelement-23"
      * ^mapping[1].comment = "serviceStopTime"
  * facilityType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.3--20200901000000 (extensible)
    * ^short = "OrganizationType / HealthcareFacilityTypeCode"
    * ^definition = """
      * The type of healthcare provider, such as general hospital, or nursing home. If this field is filled in and an AGB code is used for the HealthcareProviderIdentificationNumber, the type must match the type implicitly contained in the AGB code.
      * This code represents the type of organizational setting of the clinical encounter during which the documented act occurred.
      """
    * ^alias = "OrganisatieType"
    * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
    * ^mapping[0].map = "bbs-dataelement-546"
    * ^mapping[0].comment = "OrganizationType"
    * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
    * ^mapping[1].map = "ihexds-dataelement-31"
    * ^mapping[1].comment = "healthcareFacilityTypeCode"
  * practiceSetting from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.22--20240205133006 (extensible)
    * ^short = "DepartmentSpecialty / PracticeSettingCode "
    * ^definition = """
      * The specialty of the healthcare provider’s department. The departmental specialty can be filled in if further indication of the healthcare provider is needed. This refers to the recognized medical specialties as stated in the BIG Act.
      The bound value set is the value set that has been proposed by IHE MCWG to the EU (Xt-EHR) for national and international exchange.
      * The code specifying the clinical specialty where the act that resulted in the document was performed (e.g. Family Practice, Laboratory, Radiology). 
      """
    * ^alias = "AfdelingSpecialisme"
    * ^mapping[0].identity = "bbs-dataset-100-alpha2-20240208"
    * ^mapping[0].map = "bbs-dataelement-524"
    * ^mapping[0].comment = "DepartmentSpecialty"
    * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
    * ^mapping[1].map = "ihexds-dataelement-20"
    * ^mapping[1].comment = "practiceSettingCode"
  * sourcePatientInfo only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
    * ^short = "SourcePatientId / SourcePatientInfo"
    * ^definition = """
      * The sourcePatientId represents the subject of care medical record Identifier (e.g. Patient Id) in the local patient Identifier Domain of the Document Source.
      * The sourcePatientInfo contains demographic information of the patient to whose medical record this document belongs.
      """
    * ^mapping[0].identity = "ihexds-dataset-2024-20220712"
    * ^mapping[0].map = "ihexds-dataelement-25"
    * ^mapping[0].comment = "sourcePatientId"
    * ^mapping[1].identity = "ihexds-dataset-2024-20220712"
    * ^mapping[1].map = "ihexds-dataelement-26"
    * ^mapping[1].comment = "sourcePatientInfo"
  * related
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "identifier.type"
    * ^slicing.rules = #open
    * ^short = "ReferenceIdList"
    * ^definition = "A list of identifiers that apply to the document. Identifiers may be Accession Numbers, Order Numbers, Referral Request Identifiers, XDS Workflow Instance Identifiers, etc."
    * ^mapping.identity = "ihexds-dataset-2024-20220712"
    * ^mapping.map = "ihexds-dataelement-117"
    * ^mapping.comment = "referenceIdList"
  * related contains
      accessionNumber 0..1 and
      studyInstanceUID 0..1
  * related[accessionNumber]
    * identifier 1..1
      * type 1..1
        * ^patternCodeableConcept = urn:ietf:rfc:3986#urn:ihe:iti:xds:2013:accession
      * value 1..1
      * assigner only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
        * ^definition = "Issuer of Accession Number."
  * related[studyInstanceUID]
    * identifier 1..1
      * type 1..1
        * ^patternCodeableConcept = urn:ietf:rfc:3986#urn:ihe:iti:xds:2016:studyInstanceUID
      * value 1..1

Invariant: bbs-DocumentReference-1
Description: "Either a category for an image or a report is present."
Severity: #error
Expression: "where(system = 'urn:oid:1.3.6.1.4.1.19376.1.2.6.1' and code = 'IMAGES').exists() xor where(system = 'urn:oid:1.3.6.1.4.1.19376.1.2.6.1' and code = 'REPORTS').exists()"