// All custom ValueSets used in Image Availability

ValueSet: MedMijModality
Id: MedMijModality
Title: "MedMijModality ValueSet."
Description: "DICOM modalities that need to be supported in the MedMij use case of Image Availability."
* insert DefaultNarrative
* ^url = $MedMijModalityValueSetURL
* ^identifier.use = #official
* ^identifier.system = $URI
* ^identifier.value = $MedMijModalityValueSetOID
* ^status = #active
* ^experimental = false
* insert PublisherAndContact
* $DCM#CR "Computed Radiography"
* $DCM#CT "Computed Tomography"
* $DCM#ES "Endoscopy"
* $DCM#MR "Magnetic Resonance"
* $DCM#NM "Nuclear Medicine"
* $DCM#OT "Other"
* $DCM#PT "Positron emission tomography"
* $DCM#RF "Radiofluoroscopy"
* $DCM#SC "Secondary Capture"
* $DCM#US "Ultrasound"
* $DCM#XA "X-Ray Angiography"

ValueSet: ModalityCombined
Id: ModalityCombined
Title: "ModalityCombined ValueSet."
Description: "Value set combining the (overlapping) value sets that are defined by DICOM (in [CID 29 Acquisition Modality](https://dicom.nema.org/medical/dicom/2018a/output/chtml/part16/sect_CID_29.html)) and MedMij, respectively."
* insert DefaultNarrative
* ^url = $ModalityCombinedValueSetURL
* ^identifier.use = #official
* ^identifier.system = $URI
* ^identifier.value = $ModalityCombinedValueSetOID
* ^status = #active
* ^experimental = false
* insert PublisherAndContact
* include codes from valueset http://dicom.nema.org/medical/dicom/current/output/chtml/part16/sect_CID_29.html
* include codes from valueset MedMijModality