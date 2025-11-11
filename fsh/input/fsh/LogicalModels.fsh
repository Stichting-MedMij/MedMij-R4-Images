// All LogicalModels used in Image Availability

Logical: ImagingResearch
Parent: http://hl7.org/fhir/StructureDefinition/Element
Id: bbs-lm-ImagingResearch
Title: "Imaging Research"
Description: "Imaging research including images and reports."
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* insert Copyright
* .
  * ^alias = "Onderzoek"
* Procedure 0..1 BackboneElement "Root concept of the Procedure building block. This root concept contains all data elements of the Procedure building block."
  * ^alias = "Verrichting"
  * ProcedureStartDate 0..1 dateTime "Date/time on which the radiological examination has been performed on the patient and/or the images have been made. In practice the time is the instance on which the first image has been taken."
    * ^alias = "VerrichtingStartDatum"
  * ProcedureEndDate 0..1 dateTime "The end date (and if possible end time) of the procedure. A ‘vague’ date, such as only the year, is permitted.\nThe element offers the option to indicate the end of the period of a series of related procedures. The end date element is only used for a procedures that takes some time and is then always applied. If the procedure still continues, the value is left empty. For instantaneous or very short lasting procedures the element is omitted."
    * ^alias = "VerrichtingEindDatum"
  * ProcedureType 0..1 CodeableConcept "Description of the procedure and/or the performed imaging research (e.g. CT thorax, MRI knee, ultrasonography of breast, X-ray)."
  * ProcedureType from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.133.11.1--20230808113539 (extensible)
    * ^alias = "VerrichtingType"
  * ProcedureAnatomicalLocation 0..1 BackboneElement "Anatomical location which is the focus of the procedure."
    * ^alias = "VerrichtingAnatomischeLocatie"
    * Location 0..1 CodeableConcept "Localisation on/in the body."
    * Location from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.106.11.19--20240205123345
      * ^alias = "Locatie"
    * Laterality 0..1 CodeableConcept "Laterality adds information about body site to the anatomical location, e.g. left."
    * Laterality from http://decor.nictiz.nl/fhir/ValueSet/2.16.840.1.113883.2.4.3.11.60.40.2.20.7.2--20200901000000
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
* ImageInformation 0..1 BackboneElement "Imaging research for images and reports: subset image information"
  * ^alias = "Beeldinformatie"
  * ImageInformationIdentificationNumber 0..1 Identifier "Globally unique ID that describes the set of images. In DICOM the study/series UID can be used."
    * ^alias = "BeeldinformatieIdentificatienummer"
  * ImageDateTime 0..1 dateTime "Date/time on which the radiological examination has been performed on the patient and/or the images have been made."
    * ^alias = "BeeldDatumTijd"
  * ImageTitle 0..1 string "The title of the image."
    * ^alias = "BeeldTitel"
  * Modality 0..* CodeableConcept "Type of medical imaging device, process or method that originally acquired or produced the data used to create the image or series of images, such as a CT scanner or MRI machine."
  * Modality from $ModalityCombinedValueSetURL (required)
    * ^alias = "Modaliteit"
* ReportInformation 0..1 BackboneElement "Imaging research for images and reports: subset report information"
  * ^alias = "Verslaginformatie"
  * ReportInformationIdentificationNumber 0..1 Identifier "Globally unique ID for the report of the imaging research. In DICOM the study/series UID can be used."
    * ^alias = "VerslaginformatieIdentificatienummer"
  * ReportDateTime 0..1 dateTime "Date/time on which the report has been autorised and/or made available."
    * ^alias = "VerslagDatumTijd"
  * ReportTitle 0..1 string "The title of the report."
    * ^alias = "VerslagTitel"
* AccessionNumberInformation 0..1 BackboneElement "Information on the Accession Number"
  * ^alias = "AccessionNumberInformatie"
  * AccessionNumber 0..1 Identifier "Locally unique ID (in the RIS) that has been assigned to the imaging research."
    * ^alias = "AccessionNumber"
  * AssigningAuthority 0..1 BackboneElement "Assigning authority that issued the Accession Number."
    * ^alias = "UitgevendeInstantie"
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
* StudyInstanceUID 0..1 Identifier "The globally unique DICOM identifier of the imaging study upon which the imaging report is based, assigned by the modality or PACS."
  * ^alias = "StudyInstanceUID"

/*
Logical: ImageInformation
Id: bbs-lm-ImageInformation
Title: "Image Information"
Description: "Imaging research for images and reports: subset image information"
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* insert Copyright
* .
  * ^alias = "Beeldinformatie"
* ImageInformationIdentificationNumber 0..1 Identifier "Globally unique ID that describes the set of images. In DICOM the study/series UID can be used."
  * ^alias = "BeeldinformatieIdentificatienummer"
* ImageDateTime 0..1 dateTime "Date/time on which the radiological examination has been performed on the patient and/or the images have been made."
  * ^alias = "BeeldDatumTijd"
* ImageTitle 0..1 string "The title of the image."
  * ^alias = "BeeldTitel"
* Modality 0..* CodeableConcept "Type of medical imaging device, process or method that originally acquired or produced the data used to create the image or series of images, such as a CT scanner or MRI machine."
* Modality from $ModalityCombinedValueSetURL (required)
  * ^alias = "Modaliteit"

Logical: ReportInformation
Id: bbs-lm-ReportInformation
Title: "Report Information"
Description: "Imaging research for images and reports: subset report information"
* insert DefaultNarrative
* ^status = #active
* insert PublisherAndContact
* insert Copyright
* .
  * ^alias = "Verslaginformatie"
* ReportInformationIdentificationNumber 0..1 Identifier "Globally unique ID for the report of the imaging research. In DICOM the study/series UID can be used."
  * ^alias = "VerslaginformatieIdentificatienummer"
* ReportDateTime 0..1 dateTime "Date/time on which the report has been autorised and/or made available."
  * ^alias = "VerslagDatumTijd"
* ReportTitle 0..1 string "The title of the report."
  * ^alias = "VerslagTitel"
*/