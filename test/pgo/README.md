## Prototype Beeld in PGO

Voorbeeldimplementatie **Beeld in PGO** bij Beeldbeschikbaarheid [MedMij R4 Images IG 0.1.0-prototype](https://simplifier.net/guide/medmij-r4-images-ig). Usecase *'Raadplegen Beeld en Verslag in persoonlijke gezondheidsomgeving'* bekijkt het ophalen en tonen van beelden en beeldverslagen. In deze repository vind je een project met frontend en backend dat een PGO simuleert waarin de patiëntgebruiker beelden bekijkt met een DICOMweb-viewer.

### Testproject 0.1.0-prototype 

Frontend is geschreven in [Svelte](https://svelte.dev/) (TypeScript, JavaScript) en backend in [ASP.NET](https://dotnet.microsoft.com/en-us/apps/aspnet) (C#). Doel van het prototype is om vroeg in het ontwikkelproces fouten uit de implementatiegids te halen en het ontwerp met een implementatie te testen. Tijdens het uitwerken van het functioneel en technisch ontwerp van Beeldbeschikbaarheid verzamelen we feedback van de gebruikers en ontwikkelaars. Houd er rekening mee dat het prototype een vorm van concepttesten is en de software in deze repository veroudert.

Wil je het prototype zelf uitproberen? Voor [Visual Studio 2022](https://visualstudio.microsoft.com/vs/) is een solution-file aanwezig met projecten Pgo.Backend en Pgo.Frontend. De solution is ook te openen in Visual Studio Code met de [C# Dev Kit](https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit)-extensie. Tijdens een presentatie van het prototype aan patiënttestgebruikers gebruikte het ontwerpteam een Docker-container. Het image voor deze container bouwt met het script [build.sh](build.sh) en [Dockerfile](Dockerfile).

Bekijk hier de relevante code voor stappen in usecase:

| Beginpunten        |     |
| ------------------ | --- |
| ***Pgo.Frontend*** |
| Dossier.svelte | Dossieroverzicht van `DocumentReference` voor een patiëntgebruiker. Roept `DossierController` aan in backend-project. Gebruikt _dossier.store.ts_, _dossier-timelines.store.ts_ en _DossierTimeline.svelte_ om het overzicht op te halen, te filteren en te tonen in een tijdlijn. Er is ook een variant in tabelvorm. |
| View.svelte | Voorbeeldimplementatie van een viewer op `WADO-RS`. Roept `DocumentController` aan in backend voor het tonen van verslagen in beelden waar DocumentReference naar verwijst.  |
| ***Pgo.Backend*** |
| DossierController.cs | Frontend simuleert bij deze API-endpoints het ophalen van zorgdossier. Een overzicht van FHIR DocumentReference resources komt terug om te tonen in een tijdlijn. Simulatiestap voor importeren FHIR van DVA in PGO. |
| DocumentController.cs | Frontend haalt van deze endpoints PDF, JPEG en DICOM-bestanden op. Backend gebruikt een documentReferenceId om een `PDF` of `KOS` op te halen. DICOM KOS is een JSON-index dat verwijst naar een complete studie van beelden. Deze beelden halen we op als DICOM-archiefverzamelbestand of als foto's in JPEG uit de verzameling, geschikt voor tonen in frontend. |


### Uitwisseling FHIR-resources

Het ontwerp bespreekt [FHIR R4](https://www.hl7.org/fhir/R4/) resources [MHD DocumentReference Minimal](https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html) voor het aanbieden van verwijzingen naar beelden en verslagen. De wijze waarop een DVA deze resources aanbiedt is vastgelegd in [MedMij Afsprakenstelsel](https://afsprakenstelsel.medmij.nl/) en volgt de bekende uitwisseling na het uitlezen van Stelselnode.

In deze simulatie is het uitwisselen licht geïmplementeerd met een endpoint dat FHIR-resources van DVA ophaalt en in de FHIR-resourceserver van PGO plaatst *('import')*. Met een knop in frontend zijn de resources in PGO te verwijderen *('reset')* voor presentatie. Backend doet dit deze uitwisseling met de volgende queries voor het uitlezen. DocumentReference verwijst naar doorgaans naar resources als Organization en Practitioner.

```
GET https://fhir/r4/DocumentReference?patient=voorbeeldgebruiker

GET https://fhir/r4/Patient/voorbeeldgebruiker
GET https://fhir/r4/Practitioner/voorbeeldbehandelaar
GET https://fhir/r4/Organization/voorbeeldorganisatie

```

In map [0.1.0-prototype/test/resources](../test/resources) een overzicht van de FHIR-resources in JSON-formaat (application/fhir+json) bij usecases Beeld in PGO. Deze testdata lees je in op FHIR-server van DVA en/of PGO. In een latere fase is de uitwisseling van resources mogelijk met Interoplab Testmanager.


### Configuratie van resource servers

Backend configureert FHIR-resourceservers in [config.yaml](Pgo.Backend/config.yaml) voor PGO en de DVA dat als bron voor testdata dient. Zie DossierController.cs, [DvaConfig.cs](Pgo.Backend/Config/DvaConfig.cs) en [PgoConfig.cs](Pgo.Backend/Config/PgoConfig.cs). Een-en-ander volgt best-practices en templating voor ASP.NET MVC-projecten. Een kort overzicht van instellingen:

| Configuratie       |     |
| ------------------ | --- |
| Serilog            | Loggen van fouten en informatie in backend naar console. |
| AllowedHosts       | CORS |
| OpenTelemetryConfig| Monitoring, staat uit voor dit project. |
| ***PgoConfig*** |
| .IsBehindProxy    | Gebruikt en voegt forwarding-headers toe. |
| .BasePath         | Voegt een basispad toe aan API-endpoints, nuttig wanneer de backend niet op een eigen host draait. Bijvoorbeeld: "/backend" in https://beeldinpgo/backend/api/dossier/search |
| .FhirEndpoint     | URL van FHIR-resourceserver van PGO. Bijvoorbeeld: https://pgo-beeldinpgo/hapi/fhir |
| .StelselNodeBaseUrl | URL van Stelselnode voor het ophalen van resources. In dit prototype niet gebruikt. |
| ***DvaConfig*** |
| .FhirEndpoint | URL van FHIR-resourceserver van DVA. Bijvoorbeeld: https://dva-beeldinpgo/hapi/fhir |
| .DicomTokenEndpoint | URL van token-endpoint voor authenticatie bij DVA. |
| .DicomTokenClientId | ClientId voor authenticatie bij DVA. |
| .DicomTokenClientSecret | ClientSecret voor authenticatie bij DVA. |
| .DicomTokenClientScope | Scope voor authenticatie bij DVA. |
| .DicomWadoRSEndpoint | URL van WADO-RS voor het ophalen van DICOM-beelden. Bijvoorbeeld: https://pacs/dcm4chee-arc/aets/DCM4CHEE/rs |
| ***OpenIdConnectConfig*** |
| .Authority | URL van de OpenID Connect-provider. |
| .ClientId | ClientId voor authenticatie PGO. Bijvoorbeeld: https://pgo-beeldinpgo/identity | 

In Beeldbeschikbaarheid biedt een DVA-leverancier naast FHIR ook resources in DICOM aan. Daarom zie je naast de instellingen voor de FHIR-resourceserver in ook configuratie voor DICOMweb-resourceserver. Tijdens een proof-of-concept met deelnemers komen deze gegevens uit Stelselnode en Testmanager.

### Uitwisseling DICOM-resources

DICOMweb is een verzameling APIs voor het uitwisselen van beelden. Uit FHIR betrokken DocumentReference-resources verwijzen in `attachment.url` naar DICOMweb-resources. Specifiek gaat het om een URI zoals in het voorbeeld hieronder dat verwijst naar een WADO-RS-endpoint voor de KOS van een studie met beelden.

```json

GET https://fhir/r4/DocumentReference?patient=voorbeeldgebruiker

{
  "resourceType": "Bundle",
  "type": "document",
  "entry": [{
      "resource": {
        "resourceType": "DocumentReference",
        "id": "voorbeelddocument",
        ...
        "content": [{
          "attachment": {
          "url": "https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series",
          "contentType": "application/dicom+json"
        }
      }]
    }
  ]
}
```

Deze verwijzing naar het **DICOM KOS** (Key Object Selection file) geeft een JSON-document terug met een index van de series van beelden in de studie. Met [DICOMweb](https://en.wikipedia.org/wiki/DICOMweb) WADO-RS kunnen we deze beelden als volgt uitlezen.

```
### Uitlezen van KOS, geeft de series van beelden in een studie.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series
Authorization: Bearer eyJhbGciOiJSUzI1NiIsInR5...
Accept: application/dicom+json

{
  "00080005": "ISO_IR 100",
  "00080020": "20210901",
  "00080030": "20210901",
  "00080050": "15894627",
  "00080060": "OT",
  "00080090": "ORIGINAL",
  "00081030": "0.0",
  ...
```

```
### Downloaden van DICOM-archiefbestand.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series
Accept: multipart/related; type="application/dicom"
```
```
### Uitlezen van KOS, alle beelden in een serie.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/1.2.3/instances
Accept: application/dicom+json
```
```
### Downloaden van foto-instance 4.5.6.7.8 uit de verzameling, in DICOM-archiefformaat.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/1.2.3/instances/4.5.6.7.8
Accept: multipart/related; type="application/dicom"
```
```
### Downloaden van dezelfde foto uit de verzameling, in JPEG-formaat.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/1.2.3/instances/4.5.6.7.8/rendered
Accept: application/jpeg
```
Een studie bevat series van instances. Deze instances zijn op te halen als beelden. Prototype toont hoe instances van een serie worden uitgelezen om te komen tot rendered-beelden in een viewer. PGO's kunnen er uiteraard voor kiezen een kantenklare webviewer te gebruiken die dit soort uitleesacties al ondersteunt.

#### Frames

In DICOMweb verwijst een instance naar een beeld. Sommige instances hebben nog een [verdeling naar een frames](https://dicom.nema.org/medical/Dicom/2018d/output/chtml/part03/sect_C.7.6.6.html). Haal je het beeld op voor een instance, dan komt dat neer op het eerste frame (doorgaans frame 0). In de viewer van het prototype is een aanzet gegeven voor het tonen van frames, dit volgt nagegenoeg dezelfde stappen als het tonen van het beeld voor een instance. Gebruik bijvoorbeeld een [slider-control](https://www.w3schools.com/howto/howto_js_rangeslider.asp) om door de frames-beelden te bladeren.

```
### Downloaden van een framefoto op instance, in JPEG-formaat.
GET https://pacs/wado-rs/studies/1.2.276.0.50.10020017010.15894627.12166536.29885/series/1.2.3/instances/4.5.6.7.8/frames/9,10,11,12/rendered
Accept: application/jpeg

```

Een volledig overzicht van [DICOMweb API resource endpoints](https://www.dicomstandard.org/using/dicomweb/restful-structure). Overzicht met [verbetersuggesties voor PGO's](docs/2025-01-14%20Testresultaten%20Beeld%20in%20PGO.pdf) en [voorbeeld tonen beeld en verslag](docs/2024-01-14%20Demonstratie%20prototype%20Beeld%20in%20PGO.mp4) als video.
