# Test resources for MedMij R4 Images  

This directory contains test resources intended for testing MedMij R4 Images. These test resources are meant to support interoperability testing.

## Structure  
- The `pgo` folder contains a prototype PGO (Personal Health Environment) implementation, made by MedMij.
- The `resources` folder contains the FHIR test resources.
- The [Excel file](https://github.com/Stichting-MedMij/MedMij-R4-Images/blob/1.0.0-alpha.2/test/250228_Testdata%20Beeld%20in%20PGO.xlsx) contains the functional test data from which the FHIR resources are generated.

## Important notes
- Various identifiers, such as the Study Instance UID, Accession Number, and `DocumentReference.masterIdentifier`, are dummy/mocked values and may not reference any actual data. Adjust these as needed to fit your testing scenarios.
- The `content.attachment.url` in the DocumentReference resources for images points to an example URL. It is expected that this is replaced with a real URL (e.g., to a PACS) so that actual DICOM JSON metadata and images can be retrieved.  
- Any referenced reports are example PDFs provided in Binary format. You may also reference PDFs or reports from your own source system as needed.
- The FHIR IG now utilizes the Comprehensive Metadata option for DocumentReference profiles, which requires certain elements, such as author, authenticator, and sourcePatientInfo, to be contained within the resource. However, our current test materials include uncontained references for these elements, which is not compliant with the Comprehensive Metadata Option. We are currently deliberating whether to permit the use of the UnContained Reference Option, which allows these elements to be referenced externally rather than contained within the resource. As a result, the validation of our FHIR test instances currently fails on this point.

A ticket has been submitted to Nictiz regarding this issue: [BBS-202](https://nictiz.atlassian.net/browse/BBS-202).

## Disclaimer
These resources are for testing purposes only and may not be entirely correct.
