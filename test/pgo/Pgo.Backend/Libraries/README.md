This folder contains packages from Microsoft FhirServer feed that was recently made semi-private. While it's simple for developers to authenticate with the feed on Azure DevOps and we can have authentication to just fetch the Dicon.Client from package feed as part of our pipeline, this is a more simple approach.

For this demo, we just use the old fashion approach of including the local packages folder.

NuGet feed: https://microsofthealthoss.visualstudio.com/FhirServer/_artifacts/feed/Public/NuGet/Microsoft.Health.Dicom.Client/versions
Code repo: https://github.com/microsoft/fhir-server/releases

Packages:

- microsoft.health.dicom.client (the wrapper we use to interact with the Dicom server)
- microsoft.health.fellowoakdicom (dependency based on https://github.com/fo-dicom/fo-dicom )
- microsoft.health.operations (dependency)