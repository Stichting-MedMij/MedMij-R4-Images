// Profile on DocumentReference derived from IHE MHD used in Image Availability

Profile: BbsDocumentReference
Parent: https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.DocumentReference
Id: bbs-DocumentReference
Title: "bbs DocumentReference"
Description: "Imaging study including images and reports."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This DocumentReference resource represents the Study building block for patient use cases in the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid). This profile is based on the [IHE.MHD.UnContained.Comprehensive.DocumentReference profile](https://profiles.ihe.net/ITI/MHD/StructureDefinition/IHE.MHD.UnContained.Comprehensive.DocumentReference)."
* insert Copyright
* . obeys bbs-DocumentReference-1 and bbs-DocumentReference-2
  * ^short = "Study"
  * ^definition = "Imaging study including images and reports."
  * ^alias = "Onderzoek"
* masterIdentifier
  * ^short = "ReportInformationIdentificationNumber / ImageInformationIdentificationNumber / UniqueID"
  * ^definition = """
      * Globally unique ID for the report of the imaging study. In DICOM the study/series UID can be used.
      * Globally unique ID that describes the set of images. In DICOM the study/series UID can be used.
      * The globally unique identifier assigned by the document creator to this document.
    """
  * ^alias[0] = "VerslaginformatieIdentificatienummer"
  * ^alias[1] = "BeeldinformatieIdentificatienummer"
* status
  * ^short = "AvailabilityStatus"
  * ^definition = "The lifecycle status of the document."
  * ^patternCode = #current
* type from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.133.11.1--20230808113539 (extensible)
  * ^short = "ProcedureType / TypeCode"
  * ^definition = """
      * Description of the procedure and/or the performed imaging study (e.g. CT thorax, MRI knee, ultrasonography of breast, X-ray).
      * The code specifying the precise kind of document (e.g. Pulmonary History and Physical, Discharge Summary, Ultrasound Report).
    """
  * ^comment = """
    The value set bound to this element is a thesaurus managed, owned and distributed by DHD (namely the Verrichtingenthesaurus (VT)). Every concept in the VT is linked to a unique SNOMED concept, but it is no SNOMED reference set, and in particular it is not published on the SNOMED browsers. In order to retrieve the contents of the VT, authorized access is required.

    The XDS metadata element typeCode, which normally contains the precise type of document, is mapped on `.type` in [core FHIR](https://hl7.org/fhir/R4/documentreference-mappings.html#xds). In XDS-I, and consequently, the Nictiz IG, the typeCode element is used to indicate the procedure type instead. Even though `.context.event` is better suited to convey the procedure type from a FHIR perspective, the core FHIR mapping between typeCode and `.type` is retained.
    """
  * ^alias = "VerrichtingType"
* category
  * ^short = "ClassCode"
  * ^definition = "The code specifying the particular kind of document."
  * coding 1..*
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains
      images 0..1 and
      reports 0..1
  * coding[images] 
    * ^patternCoding = $XDSClassCode#IMAGES
    * ^condition[0] = "bbs-DocumentReference-1"
    * ^condition[1] = "bbs-DocumentReference-2"
  * coding[reports]
    * ^patternCoding = $XDSClassCode#REPORTS
    * ^condition = "bbs-DocumentReference-1"
* subject only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
  * ^short = "Patient / PatientId"
  * ^alias = "Patient"
* date 1..1
  * ^short = "DateTime / CreationTime"
  * ^definition = """
        * Date/time on which the report has been autorised and/or made available (if the DocumentReference represents an imaging report).
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made (if the DocumentReference represents an imaging study).
        * The time the author created the document. Shall have a single value.
        """
  * ^alias = "DatumTijd"
* author 1..*
  * ^slicing.discriminator.type = #profile
  * ^slicing.discriminator.path = "resolve()"
  * ^slicing.rules = #open
  * ^short = "Author"
* author contains
    location 1..1 and
    performer 0..*
* author[location] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
  * ^short = "Location"
  * ^definition = "The healthcare center where the procedure was, is or will be carried out."
  * ^alias = "Locatie"
* author[performer] only Reference(http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)
  * ^short = "Performer"
  * ^definition = "The health professional who carried out or will carry out the procedure. In most cases, only the medical specialty is entered, and not the name of the health professional. In the context of image exchange, the Performing Physician should be conveyed here, and NOT the laboratory technician who makes the images (i.e. the Operator)."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
  * ^alias = "Uitvoerder"
* authenticator only Reference(Practitioner or PractitionerRole or Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
  * ^short = "LegalAuthenticator"
  * ^definition = "Represents a participant who has legally authenticated or attested the document within the author institution."
  * ^comment = """
    Each occurrence of the zib HealthProfessional is normally represented by _two_ FHIR resources: a PractitionerRole resource (instance of [nl-core-HealthProfessional-PractitionerRole](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole)) and a Practitioner resource (instance of [nl-core-HealthProfessional-Practitioner](http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner)). The Practitioner resource is referenced from the PractitionerRole instance. For this reason, sending systems should fill the reference to the PractitionerRole instance here, and not the Practitioner resource. Receiving systems can then retrieve the reference to the Practitioner resource from that PractitionerRole instance.
    
    In rare circumstances, there is only a Practitioner instance, in which case it is that instance which will be referenced here. However, since this should be the exception, the nl-core-HealthProfessional-Practitioner profile is not explicitly mentioned as a target profile.
    """
* description
  * ^short = "Comments"
  * ^definition = "Comments associated with the document."
* securityLabel from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.6--20131212104106 (extensible)
  * ^short = "ConfidentialityCode"
  * ^definition = "The code specifying the level of confidentiality of the document."
* content
  * attachment
    * contentType
      * ^short = "MimeType"
      * ^definition = "MIME type of the document."
      * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[key].valueId = "bbs-DocumentReference-binding-contentType-1"
      * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[purpose].valueCode = #extensible
      * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[valueSet].valueCanonical = "http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.8--20131212104106"
    * language from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.12--20131212104106 (extensible)
      * ^short = "LanguageCode"
      * ^definition = "Specifies the human language of character data in the document. Using codes from IETF RFC 3066."
    * url
      * ^short = "URI"
      * ^definition = "The URI for the document."
    * size
      * ^short = "Size"
      * ^definition = "Size in bytes of the document."
    * hash
      * ^short = "Hash"
      * ^definition = "Hash of the document itself."
    * title
      * ^short = "ReportTitle / ImageTitle / Title"
      * ^definition = """
        * The title of the report.
        * The title of the image.
        * The title of the document.
        """
      * ^alias[0] = "VerslagTitel"
      * ^alias[1] = "BeeldTitel"
    * creation
      * ^short = "DateTime / CreationTime"
      * ^definition = """
        * Date/time on which the report has been autorised and/or made available (if the DocumentReference represents an imaging report).
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made (if the DocumentReference represents an imaging study).
        * The time the author created the document. Shall have a single value.
        """
      * ^alias = "DatumTijd"
  * format from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.7--20131212104106 (extensible)
    * ^short = "FormatCode"
    * ^definition = "Code globally uniquely specifying the format of the document."
* context
  * encounter only Reference(Encounter or EpisodeOfCare or http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter)
    * ^short = "ReferenceIdList"
    * ^definition = "A list of identifiers that apply to the document. Identifiers may be Accession Numbers, Order Numbers, Referral Request Identifiers, XDS Workflow Instance Identifiers, etc."
    * ^comment = "Only Encounters on the ReferenceIdList are conveyed here, while other identifiers on that list are conveyed via `.context.related`."
  * event
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
    * ^short = "EventCodeList"
    * ^definition = "This list of codes represents the main clinical acts, such as a colonoscopy or an appendectomy, being documented."
  * event contains
    procedureAnatomicalLocation 0..1 and
    modality 0..*
  * event[procedureAnatomicalLocation] only http://nictiz.nl/fhir/StructureDefinition/nl-core-AnatomicalLocation
  * event[procedureAnatomicalLocation] from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.19--20240205123345 (required)
    * ^short = "ProcedureAnatomicalLocation / Location"
    * ^definition = """
      Anatomical location which is the focus of the procedure.

      The value set is proposed by IHE MCWG and also suggested for the EU (Xt-EHR). The used value set is a subset of the value set defined in zib2020.
      """
    * ^alias[0] = "VerrichtingAnatomischeLocatie"
    * ^alias[1] = "Locatie"
  * event[modality] from $ModalityCombinedValueSetURL (required)
    * ^short = "Modality"
    * ^definition = "Type of medical imaging device, process or method that originally acquired or produced the data used to create the image or series of images, such as a CT scanner or MRI machine."
    * ^comment = "For an image or series of images the modalities SHALL be specified."
    * ^alias = "Modaliteit"
    * ^condition = "bbs-DocumentReference-2"
    * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[key].valueId = "bbs-DocumentReference-binding-modality-1"
    * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[purpose].valueCode = #minimum
    * ^binding.extension[http://hl7.org/fhir/tools/StructureDefinition/additional-binding].extension[valueSet].valueCanonical = $MedMijModalityValueSetURL
  * period 1..1
    * start 1..1
      * ^short = "ProcedureStartDate / ServiceStartTime"
      * ^definition = """
        * Date/time on which the radiological examination has been performed on the patient and/or the images have been made. In practice the time is the instance on which the first image has been taken.
        * The start time the service being documented took place.
        """
      * ^alias = "VerrichtingStartDatum"
    * end
      * ^short = "ProcedureEndDate / ServiceStopTime"
      * ^definition = """
        * The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted.
        The element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty. For instantaneous or very short lasting procedures the element is omitted. 
        * The stop time the service being documented took place.
        """
      * ^alias = "VerrichtingEindDatum"
  * facilityType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.3--20200901000000 (extensible)
    * ^short = "OrganizationType / HealthcareFacilityTypeCode"
    * ^definition = """
      * The type of healthcare provider, such as general hospital, or nursing home. If this field is filled in and an AGB code is used for the HealthcareProviderIdentificationNumber, the type must match the type implicitly contained in the AGB code.
      * This code represents the type of organizational setting of the clinical encounter during which the documented act occurred.
      """
    * ^alias = "OrganisatieType"
  * practiceSetting from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.22--20240205133006 (required)
    * ^short = "DepartmentSpecialty / PracticeSettingCode "
    * ^definition = """
      * The specialty of the healthcare provider’s department. The departmental specialty can be filled in if further indication of the healthcare provider is needed. This refers to the recognized medical specialties as stated in the BIG Act.
      The bound value set is the value set that has been proposed by IHE MCWG to the EU (Xt-EHR) for national and international exchange.
      * The code specifying the clinical specialty where the act that resulted in the document was performed (e.g. Family Practice, Laboratory, Radiology). 
      """
    * ^alias = "AfdelingSpecialisme"
  * sourcePatientInfo only Reference(Patient or http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient)
    * ^short = "SourcePatientId / SourcePatientInfo"
    * ^definition = """
      * The sourcePatientId represents the subject of care medical record Identifier (e.g. Patient Id) in the local patient Identifier Domain of the Document Source.
      * The sourcePatientInfo contains demographic information of the patient to whose medical record this document belongs.
      """
  * related
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "identifier.type"
    * ^slicing.rules = #open
    * ^short = "ReferenceIdList"
    * ^definition = """
      A list of identifiers that apply to the document. Identifiers may be Accession Numbers, Order Numbers, Referral Request Identifiers, XDS Workflow Instance Identifiers, etc. 
      
      For Imaging (Reports), use the Accession Number with Assigning Authority, Order Number with Assigning Authority and StudyUID, as proposed by the IHE MCWG to support linking the Images and Reports together.
      """
    * ^comment = "Encounters on the ReferenceIdList are conveyed via `.context.encounter`."
  * related contains
      accessionNumber 0..1 and
      studyInstanceUID 0..1
  * related[accessionNumber]
    * identifier 1..1
      * ^short = "AccessionNumber"
      * ^definition = "A locally unique record number in the RIS that identifies the imaging procedure request."
      * ^alias = "AccessionNumber"
      * type 1..1
        * ^patternCodeableConcept = $URI#urn:ihe:iti:xds:2013:accession
      * system
        * ^comment = "In DICOM, the Accession Number is just a string (namely of DICOM data type _Short String_ (_SH_)). In order to ensure uniqueness of the Accession Number, a `.system` SHOULD be provided. It is up to the Assigning Authority that issued the Accession Number to determine and manage an appropriate URL or URN as `.system`. If no specific URL or URN for the Accession Number identifier system is provided in the source data, the identifier of the Assigning Authority itself SHOULD be used as fallback, i.e. the OID registered for the Assigning Authority, which should be present in DICOM tag `(0040,0032)` (Universal Entity ID) as part of `(0008,0051)` (Issuer of Accession Number Sequence)."
      * value 1..1
      * assigner only Reference(Organization or http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization)
        * ^short = "AssigningAuthority"
        * ^definition = "Assigning authority that issued the Accession Number."
        * ^alias = "UitgevendeInstantie"
  * related[studyInstanceUID]
    * identifier 1..1
      * ^short = "StudyInstanceUID"
      * ^definition = "The globally unique DICOM identifier of the imaging study upon which the imaging report is based, assigned by the modality or PACS."
      * ^alias = "StudyInstanceUID"
      * type 1..1
        * ^patternCodeableConcept = $URI#urn:ihe:iti:xds:2016:studyInstanceUID
      * system 1..1
        * ^patternUri = $DICOMUniqueId
      * value 1..1
      * value obeys bbs-DocumentReference-3
        * ^comment = "As the Study Instance UID is a DICOM UID, its value SHALL be prefixed with _urn:oid:_."

Invariant: bbs-DocumentReference-1
Description: "Either a category for an image or a report is present."
Severity: #error
Expression: "category.coding.where(system = 'urn:oid:1.3.6.1.4.1.19376.1.2.6.1' and code = 'IMAGES').exists() xor category.coding.where(system = 'urn:oid:1.3.6.1.4.1.19376.1.2.6.1' and code = 'REPORTS').exists()"

Invariant: bbs-DocumentReference-2
Description: "For an image or series of images the modalities are specified."
Severity: #error
Expression: "category.coding.where(system = 'urn:oid:1.3.6.1.4.1.19376.1.2.6.1' and code = 'IMAGES').exists() implies context.event.coding.where(system = 'http://dicom.nema.org/resources/ontology/DCM').exists()"

Invariant: bbs-DocumentReference-3
Description: "Each DICOM UID value is a proper OID."
Severity: #error
Expression: "$this.startsWith('urn:oid:')"

Mapping: BbsDocumentReferenceBeeldbeschikbaarheidNictiz
Source: BbsDocumentReference
Target: "https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html"
Id: bbs-dataset-100-alpha2-20240208
Title: "ART-DECOR Dataset BBS 1.0.0-alpha.2 20240208"
* -> "bbs-dataelement-66" "Study"
* masterIdentifier -> "bbs-dataelement-100" "ReportInformationIdentificationNumber"
* masterIdentifier -> "bbs-dataelement-784" "ImageInformationIdentificationNumber"
* type -> "bbs-dataelement-176" "ProcedureType"
* subject -> "bbs-dataelement-132" "Patient"
* date -> "bbs-dataelement-101" "DateTime"
* date -> "bbs-dataelement-69" "DateTime"
* author[location] -> "bbs-dataelement-185" "Location"
* author[performer] -> "bbs-dataelement-187" "Performer"
* content
  * attachment
    * creation -> "bbs-dataelement-101" "DateTime"
    * creation -> "bbs-dataelement-69" "DateTime"
* context
  * event[procedureAnatomicalLocation] -> "bbs-dataelement-178" "ProcedureAnatomicalLocation"
  * event[procedureAnatomicalLocation] -> "bbs-dataelement-179" "Location"
    * extension[http://nictiz.nl/fhir/StructureDefinition/ext-AnatomicalLocation.Laterality]
      * valueCodeableConcept -> "bbs-dataelement-180" "Laterality"
  * period
    * start -> "bbs-dataelement-174" "ProcedureStartDate"
    * end -> "bbs-dataelement-175" "ProcedureEndDate"
  * facilityType -> "bbs-dataelement-546" "OrganizationType"
  * practiceSetting -> "bbs-dataelement-524" "DepartmentSpecialty"

Mapping: BbsDocumentReferenceMedMij-100-beta1
Source: BbsDocumentReference
Id: bbs-medmij-dataset-100-beta1-20250807
Title: "Dataset Beeldbeschikbaarheid MedMij 1.0.0-beta.1 20250807"
* content
  * attachment
    * title -> "bbs-medmij-dataelement-2" "ReportTitle"
    * title -> "bbs-medmij-dataelement-1" "ImageTitle"
* context
  * event[modality] -> "bbs-medmij-dataelement-5" "Modality"
  * related[accessionNumber]
    * identifier -> "bbs-medmij-dataelement-3" "AccessionNumber"
  * related[studyInstanceUID]
    * identifier -> "bbs-medmij-dataelement-4" "StudyInstanceUID"

Mapping: BbsDocumentReferenceMedMij-100-rc1
Source: BbsDocumentReference
Id: bbs-medmij-dataset-100-rc1-20250919
Title: "Dataset Beeldbeschikbaarheid MedMij 1.0.0-rc.1 20250919"
* content
  * attachment
    * title -> "bbs-medmij-dataelement-2" "ReportTitle"
    * title -> "bbs-medmij-dataelement-1" "ImageTitle"
* context
  * event[modality] -> "bbs-medmij-dataelement-5" "Modality"
  * related[accessionNumber]
    * identifier -> "bbs-medmij-dataelement-3" "AccessionNumber"
      * system -> "bbs-medmij-dataelement-7" "AssigningAuthority (implicit, main mapping is on .context.related[accessionNumber].identifier.assigner)"
      * assigner -> "bbs-medmij-dataelement-7" "AssigningAuthority"
  * related[studyInstanceUID]
    * identifier -> "bbs-medmij-dataelement-4" "StudyInstanceUID"

Mapping: BbsDocumentReferenceIHEXDS
Source: BbsDocumentReference
Target: "https://decor.nictiz.nl/pub/nihemds/ihexds-html-20220712T144728/ds-2.16.840.1.113883.2.4.3.11.60.106.1.1-2013-12-04T122419.html"
Id: ihexds-dataset-2024-20220712
Title: "ART-DECOR Dataset Nationale IHE MetaData Set (2024)"
* masterIdentifier -> "ihexds-dataelement-29" "uniqueID"
* status -> "ihexds-dataelement-3" "availabilityStatus"
* type -> "ihexds-dataelement-28" "typeCode"
* category -> "ihexds-dataelement-9" "classCode"
* subject -> "ihexds-dataelement-19" "patientId"
* date -> "ihexds-dataelement-11" "creationTime"
* author -> "ihexds-dataelement-2" "author"
* authenticator -> "ihexds-dataelement-17" "legalAuthenticator"
* description -> "ihexds-dataelement-4" "comments"
* securityLabel -> "ihexds-dataelement-10" "confidentialityCode"
* content
  * attachment
    * contentType -> "ihexds-dataelement-18" "mimeType"
    * language -> "ihexds-dataelement-16" "languageCode"
    * url -> "ihexds-dataelement-30" "URI"
    * size -> "ihexds-dataelement-24" "size"
    * hash -> "ihexds-dataelement-14" "hash"
    * title -> "ihexds-dataelement-27" "title"
    * creation -> "ihexds-dataelement-11" "creationTime"
  * format -> "ihexds-dataelement-13" "formatCode"
* context
  * encounter -> "ihexds-dataelement-117" "referenceIdList"
  * event -> "ihexds-dataelement-12" "eventCodeList"
  * period
    * start -> "ihexds-dataelement-22" "serviceStartTime"
    * end -> "ihexds-dataelement-23" "serviceStopTime"
  * facilityType -> "ihexds-dataelement-31" "healthcareFacilityTypeCode"
  * practiceSetting -> "ihexds-dataelement-20" "practiceSettingCode"
  * sourcePatientInfo -> "ihexds-dataelement-25" "sourcePatientId"
  * sourcePatientInfo -> "ihexds-dataelement-26" "sourcePatientInfo"
  * related -> "ihexds-dataelement-117" "referenceIdList"