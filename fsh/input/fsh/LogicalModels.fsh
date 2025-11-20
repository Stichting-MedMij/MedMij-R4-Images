// All LogicalModels used in Image Availability

Logical: LmPatient
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: bbs-lm-Patient
Title: "Patient"
Description: "The person on which an imaging study is performed."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the Patient building block for patient use cases in the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = true
* .
  * ^alias = "Patient"
* NameInformation 0..1 BackboneElement "Patient's full name."
  * ^alias = "Naamgegevens"
  * FirstNames 0..1 string "The first names of the patient."
    * ^alias = "Voornamen"
  * Initials 0..1 string "The initials of the patient."
    * ^alias = "Initialen"
  * LastName 0..1 BackboneElement "Container of the LastName concept. This container contains all data elements of the LastName concept."
    * ^alias = "Geslachtsnaam"
    * Prefix 0..1 string "Prefix to the last name of the patient."
      * ^alias = "Voorvoegsels"
    * LastName 0..1 string "The last name of the patient."
      * ^alias = "Achternaam"
* PatientIdentificationNumber 0..1 Identifier "The patient's identification number."
  * ^alias = "Identificatienummer"
* DateOfBirth 0..1 dateTime "Patient's date of birth."
  * ^alias = "Geboortedatum"
* Gender 0..1 CodeableConcept "Patient's administrative gender."
* Gender from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.0.1.1--20200901000000 (required)
  * ^alias = "Geslacht"

Logical: LmPatientServeTimeline
Parent: bbs-lm-Patient
Id: bbs-lm-Patient-serve-timeline
Title: "Patient (Serve image and report timeline)"
Description: "The person on which an imaging study is performed."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents (the functional requirements of) the Patient building block in the 'Serve image and report timeline' transaction within the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = false
* .
  * ^mustSupport = true
* NameInformation 1..1
  * ^mustSupport = true
  * FirstNames
    * ^mustSupport = true
  * Initials
    * ^mustSupport = true
  * LastName 1..1
    * ^mustSupport = true
    * Prefix
      * ^mustSupport = true
    * LastName 1..1
      * ^mustSupport = true
* PatientIdentificationNumber 1..1
  * ^mustSupport = true
* DateOfBirth 1..1
  * ^mustSupport = true
* Gender
  * ^mustSupport = true

Logical: LmPatientServeImageReport
Parent: bbs-lm-Patient
Id: bbs-lm-Patient-serve-image-report
Title: "Patient (Serve image and report)"
Description: "The person on which an imaging study is performed."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents (the functional requirements of) the Patient building block in the 'Serve image and report' transaction within the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = false
* .
  * ^mustSupport = true
* NameInformation 1..1
  * ^mustSupport = true
  * FirstNames
    * ^mustSupport = true
  * Initials
    * ^mustSupport = true
  * LastName 1..1
    * ^mustSupport = true
    * Prefix
      * ^mustSupport = true
    * LastName 1..1
      * ^mustSupport = true
* PatientIdentificationNumber 1..1
  * ^mustSupport = true
* DateOfBirth 1..1
  * ^mustSupport = true
* Gender
  * ^mustSupport = true

Logical: LmStudy
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: bbs-lm-Study
Title: "Study"
Description: "Imaging study including images and reports."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents the Study building block for patient use cases in the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = true
* .
  * ^alias = "Onderzoek"
* Procedure 0..1 BackboneElement "Root concept of the Procedure building block. This root concept contains all data elements of the Procedure building block."
  * ^alias = "Verrichting"
  * ProcedureStartDate 0..1 dateTime "Date/time on which the radiological examination has been performed on the patient and/or the images have been made. In practice the time is the instance on which the first image has been taken."
    * ^alias = "VerrichtingStartDatum"
  * ProcedureEndDate 0..1 dateTime "The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted.\nThe element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty. For instantaneous or very short lasting procedures the element is omitted."
    * ^alias = "VerrichtingEindDatum"
  * ProcedureType 0..1 CodeableConcept "Description of the procedure and/or the performed imaging study (e.g. CT thorax, MRI knee, ultrasonography of breast, X-ray)."
  * ProcedureType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.133.11.1--20230808113539 (extensible)
    * ^alias = "VerrichtingType"
  * ProcedureAnatomicalLocation 0..1 BackboneElement "Anatomical location which is the focus of the procedure."
    * ^alias = "VerrichtingAnatomischeLocatie"
    * Location 0..1 CodeableConcept "Localisation on/in the body."
    * Location from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.19--20240205123345 (required)
      * ^alias = "Locatie"
    * Laterality 0..1 CodeableConcept "Laterality adds information about body site to the anatomical location, e.g. left."
    * Laterality from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.7.2--20200901000000 (required)
      * ^alias = "Lateraliteit"
  * Location 0..1 BackboneElement "The healthcare center where the procedure was, is or will be carried out."
    * ^alias = "Locatie"
    * HealthcareProvider 0..1 BackboneElement "Root concept of the HealthcareProvider building block. This root concept contains all data elements of the HealthcareProvider building block."
      * ^alias = "Zorgaanbieder"
      * HealthcareProviderIdentificationNumber 0..1 Identifier "The organization's identification number."
        * ^alias = "ZorgaanbiederIdentificatienummer"
      * OrganizationName 0..1 string "Name of the organization. If an identification number is given, the name must match the name that corresponds to the identification number."
        * ^alias = "OrganisatieNaam"
      * DepartmentSpecialty 0..1 CodeableConcept "The specialty of the healthcare provider's department where the procedure has been performed."
      * DepartmentSpecialty from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.22--20240205133006 (required)
        * ^alias = "AfdelingSpecialisme"
      * OrganizationType 0..1 CodeableConcept "The type of healthcare provider."
      * OrganizationType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.3--20200901000000 (extensible)
        * ^alias = "OrganisatieType"
  * Performer 0..* BackboneElement "The health professional who carried out or will carry out the procedure. In most cases, only the medical specialty is entered, and not the name of the health professional. In the context of image exchange, the Performing Physician should be conveyed here, and NOT the laboratory technician who makes the images (i.e. the Operator)."
    * ^alias = "Uitvoerder"
    * HealthProfessional 0..1 BackboneElement "Root concept of the HealthProfessional building block. This root concept contains all data elements of the HealthProfessional building block."
      * ^alias = "Zorgverlener"
      * HealthProfessionalIdentificationNumber 0..1 Identifier "The healthcare provider identification number is a number that uniquely identifies the healthcare provider."
        * ^alias = "ZorgverlenerIdentificatienummer"
      * NameInformation 0..1 BackboneElement "Health professional's full name. If a health professional identification number is entered, it will be the name as listed in UZI, AGB or by the healthcare center."
        * ^alias = "Naamgegevens"
        * FirstNames 0..1 string "The first names of the health professional."
          * ^alias = "Voornamen"
        * Initials 0..1 string "The initials of the health professional."
          * ^alias = "Initialen"
        * LastName 0..1 BackboneElement "Container of the LastName concept. This container contains all data elements of the LastName concept."
          * ^alias = "Geslachtsnaam"
          * Prefix 0..1 string "Prefix to the last name of the health professional."
            * ^alias = "Voorvoegsels"
          * LastName 0..1 string "The last name of the health professional."
            * ^alias = "Achternaam"
      * Specialty 0..1 CodeableConcept "Health professional's medical specialty."
      * Specialty from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.121.11.22--20200901000000 (required)
        * ^alias = "Specialisme"
      * HealthProfessionalRole 0..1 CodeableConcept "The role the health professional fulfils in the healthcare process."
      * HealthProfessionalRole from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.1.5--20200901000000 (extensible)
        * ^alias = "ZorgverlenerRol"
* ImageInformation 0..1 BackboneElement "Imaging study for images and reports: subset image information"
  * ^alias = "Beeldinformatie"
  * ImageInformationIdentificationNumber 0..1 Identifier "Globally unique ID that describes the set of images. In DICOM the study/series UID can be used."
    * ^alias = "BeeldinformatieIdentificatienummer"
  * ImageDateTime 0..1 dateTime "Date/time on which the radiological examination has been performed on the patient and/or the images have been made."
    * ^alias = "BeeldDatumTijd"
  * ImageTitle 0..1 string "The title of the image."
    * ^alias = "BeeldTitel"
  * Images 0..* Attachment "The images themselves. In DICOM the images are structured in series."
    * ^alias = "Beelden"
  * Modality 0..* CodeableConcept "Type of medical imaging device, process or method that originally acquired or produced the data used to create the image or series of images, such as a CT scanner or MRI machine."
  * Modality from $ModalityCombinedValueSetURL (required)
    * ^alias = "Modaliteit"
* ReportInformation 0..1 BackboneElement "Imaging study for images and reports: subset report information"
  * ^alias = "Verslaginformatie"
  * ReportInformationIdentificationNumber 0..1 Identifier "Globally unique ID for the report of the imaging study. In DICOM the study/series UID can be used."
    * ^alias = "VerslaginformatieIdentificatienummer"
  * ReportDateTime 0..1 dateTime "Date/time on which the report has been autorised and/or made available."
    * ^alias = "VerslagDatumTijd"
  * ReportTitle 0..1 string "The title of the report."
    * ^alias = "VerslagTitel"
  * Report 0..1 Attachment "The report itself."
    * ^alias = "Verslag"
* AccessionNumberInformation 0..1 BackboneElement "Information on the Accession Number"
  * ^alias = "AccessionNumberInformatie"
  * AccessionNumber 0..1 Identifier "Locally unique ID (in the RIS) that has been assigned to the imaging study."
    * ^alias = "AccessionNumber"
  * AssigningAuthority 0..1 BackboneElement "Assigning authority that issued the Accession Number."
    * ^alias = "UitgevendeInstantie"
    * HealthcareProvider 0..1 BackboneElement "Root concept of the HealthcareProvider building block. This root concept contains all data elements of the HealthcareProvider building block."
      * ^alias = "Zorgaanbieder"
      * HealthcareProviderIdentificationNumber 0..1 Identifier "The organization's identification number."
        * ^alias = "ZorgaanbiederIdentificatienummer"
      * OrganizationName 0..1 string "Name of the organization. If an identification number is given, the name must match the name that corresponds to the identification number."
        * ^alias = "OrganisatieNaam"
      * DepartmentSpecialty 0..1 CodeableConcept "The specialty of the healthcare provider's department."
      * DepartmentSpecialty from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.22--20240205133006 (required)
        * ^alias = "AfdelingSpecialisme"
      * OrganizationType 0..1 CodeableConcept "The type of healthcare provider."
      * OrganizationType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.17.2.3--20200901000000 (extensible)
        * ^alias = "OrganisatieType"
* StudyInstanceUID 0..1 Identifier "The globally unique DICOM identifier of the imaging study upon which the imaging report is based, assigned by the modality or PACS."
  * ^alias = "StudyInstanceUID"

Logical: LmStudyServeTimeline
Parent: bbs-lm-Study
Id: bbs-lm-Study-serve-timeline
Title: "Study (Serve image and report timeline)"
Description: "Imaging study including images and reports."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents (the functional requirements of) the Study building block in the 'Serve image and report timeline' transaction within the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = false
* .
* Procedure 1..1
  * ^mustSupport = true
  * ProcedureStartDate 1..1
    * ^mustSupport = true
  * ProcedureEndDate
    * ^mustSupport = true
  * ProcedureType 1..1
    * ^mustSupport = true
  * ProcedureAnatomicalLocation
    * ^mustSupport = true
    * Location 1..1
      * ^mustSupport = true
    * Laterality
      * ^mustSupport = true
  * Location 1..1
    * ^mustSupport = true
    * HealthcareProvider 1..1
      * ^mustSupport = true
      * HealthcareProviderIdentificationNumber 1..1
        * ^mustSupport = true
      * OrganizationName 1..1
        * ^mustSupport = true
      * DepartmentSpecialty
        * ^mustSupport = true
      * OrganizationType
        * ^mustSupport = true
  * Performer
    * ^mustSupport = true
    * HealthProfessional 1..1
      * ^mustSupport = true
      * HealthProfessionalIdentificationNumber 1..1
        * ^mustSupport = true
      * NameInformation 1..1
        * ^mustSupport = true
        * FirstNames
          * ^mustSupport = true
        * Initials
          * ^mustSupport = true
        * LastName 1..1
          * ^mustSupport = true
          * Prefix
            * ^mustSupport = true
          * LastName 1..1
            * ^mustSupport = true
      * Specialty 1..1
        * ^mustSupport = true
      * HealthProfessionalRole
        * ^mustSupport = true
* ImageInformation
  * ^mustSupport = true
  * ImageInformationIdentificationNumber 1..1
    * ^mustSupport = true
  * ImageDateTime 1..1
    * ^mustSupport = true
  * ImageTitle
    * ^mustSupport = true
  * Modality 1..*
    * ^mustSupport = true
* ReportInformation
  * ^mustSupport = true
  * ReportInformationIdentificationNumber 1..1
    * ^mustSupport = true
  * ReportDateTime 1..1
    * ^mustSupport = true
  * ReportTitle
    * ^mustSupport = true
* AccessionNumberInformation
  * ^mustSupport = true
  * AccessionNumber 1..1
    * ^mustSupport = true
  * AssigningAuthority 1..1
    * ^mustSupport = true
    * HealthcareProvider 1..1
      * ^mustSupport = true
      * HealthcareProviderIdentificationNumber 1..1
        * ^mustSupport = true
      * OrganizationName
        * ^mustSupport = true
      * DepartmentSpecialty
        * ^mustSupport = true
      * OrganizationType
        * ^mustSupport = true
* StudyInstanceUID
  * ^mustSupport = true

Logical: LmStudyServeImageReport
Parent: bbs-lm-Study
Id: bbs-lm-Study-serve-image-report
Title: "Study (Serve image and report)"
Description: "Imaging study including images and reports."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* ^purpose = "This LogicalModel represents (the functional requirements of) the Study building block in the 'Serve image and report' transaction within the context of the information standard [Image Availability (Beeldbeschikbaarheid)](https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid)."
* insert Copyright
* ^abstract = false
* .
* ImageInformation obeys bbs-lm-Study-serve-image-report-1
  * ^mustSupport = true
  * ImageInformationIdentificationNumber 1..1
    * ^mustSupport = true
  * ImageDateTime 1..1
    * ^mustSupport = true
  * ImageTitle
    * ^mustSupport = true
  * Images 1..*
    * ^mustSupport = true
  * Modality 1..*
    * ^mustSupport = true
* ReportInformation obeys bbs-lm-Study-serve-image-report-1
  * ^mustSupport = true
  * ReportInformationIdentificationNumber 1..1
    * ^mustSupport = true
  * ReportDateTime 1..1
    * ^mustSupport = true
  * ReportTitle
    * ^mustSupport = true
  * Report 1..1
    * ^mustSupport = true

Invariant: bbs-lm-Study-serve-image-report-1
Description: "At least one of ImageInformation or ReportInformation is present."
Severity: #error
Expression: "ImageInformation.exists() or ReportInformation.exists()"

Mapping: LmPatientBeeldbeschikbaarheidNictiz
Source: LmPatient
Target: "https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html"
Id: bbs-dataset-100-alpha2-20240208
Title: "ART-DECOR Dataset BBS 1.0.0-alpha.2 20240208"
* -> "bbs-dataelement-132" "Patient"
* NameInformation -> "bbs-dataelement-133" "NameInformation"
  * FirstNames -> "bbs-dataelement-134" "FirstNames"
  * Initials -> "bbs-dataelement-135" "Initials"
  * LastName -> "bbs-dataelement-138" "LastName"
    * Prefix -> "bbs-dataelement-139" "Prefix"
    * LastName -> "bbs-dataelement-140" "LastName"
* PatientIdentificationNumber -> "bbs-dataelement-166" "PatientIdentificationNumber"
* DateOfBirth -> "bbs-dataelement-167" "DateOfBirth"
* Gender -> "bbs-dataelement-168" "Gender"

Mapping: LmStudyBeeldbeschikbaarheidNictiz
Source: LmStudy
Target: "https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html"
Id: bbs-dataset-100-alpha2-20240208
Title: "ART-DECOR Dataset BBS 1.0.0-alpha.2 20240208"
* -> "bbs-dataelement-66" "Study"
* Procedure -> "bbs-dataelement-173" "Procedure"
  * ProcedureStartDate -> "bbs-dataelement-174" "ProcedureStartDate"
  * ProcedureEndDate -> "bbs-dataelement-175" "ProcedureEndDate"
  * ProcedureType -> "bbs-dataelement-176" "ProcedureType"
  * ProcedureAnatomicalLocation -> "bbs-dataelement-178" "ProcedureAnatomicalLocation"
    * Location -> "bbs-dataelement-179" "Location"
    * Laterality -> "bbs-dataelement-180" "Laterality"
  * Location -> "bbs-dataelement-185" "Location"
    * HealthcareProvider -> "bbs-dataelement-521" "HealthcareProvider"
      * HealthcareProviderIdentificationNumber -> "bbs-dataelement-522" "HealthcareProviderIdentificationNumber"
      * OrganizationName -> "bbs-dataelement-523" "OrganizationName"
      * DepartmentSpecialty -> "bbs-dataelement-524" "DepartmentSpecialty"
      * OrganizationType -> "bbs-dataelement-546" "OrganizationType"
  * Performer -> "bbs-dataelement-187" "Performer"
    * HealthProfessional -> "bbs-dataelement-383" "HealthProfessional"
      * HealthProfessionalIdentificationNumber -> "bbs-dataelement-384" "HealthProfessionalIdentificationNumber"
      * NameInformation -> "bbs-dataelement-385" "NameInformation"
        * FirstNames -> "bbs-dataelement-386" "FirstNames"
        * Initials -> "bbs-dataelement-387" "Initials"
        * LastName -> "bbs-dataelement-390" "LastName"
          * Prefix -> "bbs-dataelement-391" "Prefix"
          * LastName -> "bbs-dataelement-392" "LastName"
      * Specialty -> "bbs-dataelement-397" "Specialty"
      * HealthProfessionalRole -> "bbs-dataelement-422" "HealthProfessionalRole"
* ImageInformation -> "bbs-dataelement-67" "ImageInformation"
  * ImageInformationIdentificationNumber -> "bbs-dataelement-784" "ImageInformationIdentificationNumber"
  * ImageDateTime -> "bbs-dataelement-69" "DateTime"
  * Images -> "bbs-dataelement-689" "Images"
* ReportInformation -> "bbs-dataelement-99" "ReportInformation"
  * ReportInformationIdentificationNumber -> "bbs-dataelement-100" "ReportInformationIdentificationNumber"
  * ReportDateTime -> "bbs-dataelement-101" "DateTime"
  * Report -> "bbs-dataelement-690" "Report"

Mapping: LmStudyMedMij-100-rc1
Source: LmStudy
Id: bbs-medmij-dataset-100-rc1-20250919
Title: "Dataset Beeldbeschikbaarheid MedMij 1.0.0-rc.1 20250919"
* ImageInformation
  * ImageTitle -> "bbs-medmij-dataelement-1" "ImageTitle"
  * Modality -> "bbs-medmij-dataelement-5" "Modality"
* ReportInformation
  * ReportTitle -> "bbs-medmij-dataelement-2" "ReportTitle"
* AccessionNumberInformation -> "bbs-medmij-dataelement-6" "AccessionNumberInformation"
  * AccessionNumber -> "bbs-medmij-dataelement-3" "AccessionNumber"
  * AssigningAuthority -> "bbs-medmij-dataelement-7" "AssigningAuthority"
    * HealthcareProvider -> "bbs-medmij-dataelement-8" "HealthcareProvider"
      * HealthcareProviderIdentificationNumber -> "bbs-medmij-dataelement-9" "HealthcareProviderIdentificationNumber"
      * OrganizationName -> "bbs-medmij-dataelement-10" "OrganizationName"
      * DepartmentSpecialty -> "bbs-medmij-dataelement-11" "DepartmentSpecialty"
      * OrganizationType -> "bbs-medmij-dataelement-12" "OrganizationType"
* StudyInstanceUID -> "bbs-medmij-dataelement-4" "StudyInstanceUID"