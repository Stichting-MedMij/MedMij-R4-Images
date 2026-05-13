---
topic: TestMaterial
---

# Introduction

The functional test data can be found on the underlying pages for each of the different test scenarios. This test data is intended to support interoperability testing. FHIR and DICOM test material corresponding to the functional test material can be found on [GitHub](https://github.com/Stichting-MedMij/MedMij-R4-ImageAvailability/tree/main/examples). The FHIR test material can also be found in the Simplifier project.

For mapping between metadata, functional dataset and FHIR, please refer to the {{pagelink: TD, text: technical design, anchor: RelatingFHIRToFunctionalCounterpart}}.

## Structure
- This IG contains the functional test data from which the FHIR resources are generated.
- The Simplifier project and the `examples/fhir` folder on GitHub both contain the FHIR test resources.
- The `examples/dicom` and `examples/kos` folders on GitHub contain the DICOM files referenced by the FHIR resources and corresponding KOS objects, respectively.

## Important notes
- Various identifiers, such as the Study Instance UID, Accession Number and `DocumentReference.masterIdentifier`, are dummy/mocked values and may not reference any actual data. While testing, these should be adjusted as needed to fit the testing scenarios for the source system which is subject to the test.
- The `.content.attachment.url` in the DocumentReference resources for images points to an example URL. It is expected that this is replaced with a real URL (e.g. to a PACS) so that actual DICOM JSON metadata and images can be retrieved.
- Any referenced reports are example PDFs provided in Binary format. Instead, these may be changed as needed to reference PDFs or reports from the source system which is subject to the test.

## Disclaimer
The FHIR resources and DICOM files are for testing purposes only and may not be entirely correct.