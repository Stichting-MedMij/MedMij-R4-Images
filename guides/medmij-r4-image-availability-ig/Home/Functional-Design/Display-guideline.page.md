---
topic: Weergaverichtlijn
---

# Weergaverichtlijn

## Inleiding
Dit is de weergaverichtlijn voor de gegevensdienst Beeldbeschikbaarheid. De richtlijn bevat mock-ups die bedoeld zijn ter inspiratie. PGO’s kunnen deze voorbeelden naar eigen inzicht visueel vormgeven, zolang de gebruiksvriendelijkheid behouden blijft.

## Doel
Deze richtlijn heeft als doel om duidelijke handvatten te bieden voor een patiëntvriendelijke en begrijpelijke weergave van medische beeldgegevens in PGO's. De richtlijn ondersteunt ontwikkelaars en zorgverleners bij het:
- gebruiken van begrijpelijke en patiëntvriendelijke termen en toelichtingen;
- structureren en presenteren van een overzicht van beeldgegevens op een manier die aansluit bij de informatiebehoefte van patiënten.

De richtlijn geeft géén handvatten voor de vormgeving (kleur, vorm, lettertype, etc.) van gegevens.

Naast de weergaverichtlijn zijn ook {{pagelink:Requirements, text: requirements}} opgesteld. De requirements bevatten de minimale eisen waaraan een PGO moet voldoen en de weergaverichtlijn bestaat daaropvolgend uit visuele richtlijnen en UX-voorbeelden die aangeven hoe deze functionaliteit patiëntvriendelijk kan worden gepresenteerd.

## Weergave in PGO
Het inloggen en authenticeren bij de zorgaanbieder is niet opgenomen in deze richtlijn.

Nadat de gebruiker één of meerdere zorgaanbieders heeft gekozen waar de beschikbare beelden en verslagen opgehaald moeten worden, kan de gebruiker vanuit het hoofdmenu navigeren naar het overzichtsscherm/de tijdlijn waar de beelden en verslagen kunnen worden opgehaald.

### Overzichtsscherm beelden en verslagen
Er zijn twee weergaven gedefinieerd voor het overzicht van de beelden en verslagen:
- Weergave 1: Tabelweergave
- Weergave 2: Tijdlijnweergave

Deze weergaves vormen voorbeelden van hoe een UX-design getoond kan worden. Een PGO is vrij om één of beide van deze scenario’s te ondersteunen of zelf een weergave te maken.

#### Tabelweergave
De tabelweergave biedt gebruikers een compact overzicht van medische verslagen en beelden die zij via hun PGO kunnen inzien. De figuur hieronder bevat een visuele weergave in tabelvorm.

{{render: guides/medmij-r4-image-availability-ig/images/Tabelweergave.png}}

**Figuur 1: Voorbeeld van de tabelweergave**

#### Tijdlijnweergave
De tijdlijnweergave biedt gebruikers een visueel overzicht van alle medische verslagen en beelden die beschikbaar zijn in de PGO. De figuur hieronder bevat een visuele weergave van de tijdlijn.

{{render: guides/medmij-r4-image-availability-ig/images/Tijdlijnweergave.png}}

**Figuur 2: Voorbeeld van de tijdlijnweergave**

#### Acceptatiecriteria
| | Acceptatiecriteria |
| --- | --- |
| 1. | Standaard worden alle beelden en verslagen van alle zorgaanbieders weergegeven. |
| 2. | Beelden en verslagen zijn standaard chronologisch gesorteerd van nieuw naar oud. |
| 3. | Zoeken op (een deel van) de naam van het onderzoek of informatie uit andere kolommen is mogelijk. |
| 4. | Voor elk document wordt basisinformatie getoond (onderzoeksdatum, type document (i.e. verslag of beeld), naam onderzoek (beeldtitel/verslagtitel), zorginstelling, soort beeld). |
| 5. | Als de titel van een verslag of beeld ontbreekt, dan wordt dit expliciet gemeld in de betreffende tijdlijnregel. |
| 6. | Filteren van beelden en verslagen is mogelijk op onderzoeksdatum, zorginstelling en type bestand. |
| 7. | Verslag en beeld zijn visueel gelinkt indien beide beschikbaar zijn en in de bron gekoppeld zijn middels het Accession Number. |
| 8. | Een gebruiker kan een verslag of een volledig onderzoek (corresponderend met één tijdlijnregel) downloaden. |

**Tabel 1: Acceptatiecriteria voor het overzichtsscherm**

### Detailscherm beeld
Als de gebruiker een specifiek beeld in het overzichtsscherm selecteert en vanuit daar opent, wordt een detailscherm van het betreffende beeld aan de gebruiker getoond. De beeld-viewer wordt geopend in de browser of als programma/app in de PGO.

{{render: guides/medmij-r4-image-availability-ig/images/Voorbeeld beeld.png}}

**Figuur 3: Voorbeeld van een beeld**

| | Acceptatiecriteria |
| --- | --- |
| 1. | Een gebruiker kan het beeld of het volledige onderzoek downloaden. |
| 2. | Een gebruiker kan in- en uitzoomen. |
| 3. | Indien het bestand meerdere beelden bevat (bijvoorbeeld bij een CT of MRI), kan een gebruiker door de verschillende beelden heen scrollen of deze beelden afspelen als een filmpje. |

**Tabel 2: Acceptatiecriteria voor het detailscherm van een beeld**

### Detailscherm verslag
Als de gebruiker een specifiek verslag in het overzichtsscherm selecteert en vanuit daar opent, wordt een PDF-viewer geopend waarin het betreffende verslag wordt getoond.

{{render: guides/medmij-r4-image-availability-ig/images/Voorbeeld verslag.png}}

**Figuur 4: Voorbeeld van een verslag**

| | Acceptatiecriteria |
| --- | --- |
| 1. | Een gebruiker kan in- en uitzoomen in de PDF-viewer. |

**Tabel 3: Acceptatiecriteria voor het detailscherm van een verslag**

### Relevante gegevens
In de tabel hieronder staan de gegevens die relevant zijn voor deze weergaverichtlijn.

| Naam dataelement | Advies weergavetekst in PGO | Voorbeeld | Weergeven |
| --- | --- | --- | --- |
| VerrichtingStartDatum | Onderzoeksdatum | 31-01-2020 | Ja  |
| BeeldTitel | Naam onderzoek | C. van Wijk radiologiebeelden | Ja, indien beschikbaar  |
| VerslagTitel | Naam onderzoek | Cardiologiebeelden C. van Wijk | Ja, indien beschikbaar  |
| OrganisatieNaam | Zorginstelling | OLVG Oost | Ja  |
| Uitvoerder.Zorgverlener.Naamgegevens (Voornamen/Initialen/Geslachtsnaam) | Uitvoerend zorgverlener | J. ter Velde | Ja, indien beschikbaar |
| Modaliteit | Soort beeld | CT | Ja, indien het een beeld betreft |

**Tabel 4: Relevante gegevens m.b.t. de weergaverichtlijn**

De volgende tabel bevat patiëntvriendelijke termen voor alle SOP-klassen die ondersteund moeten worden (zie ook Tabel 9 in het {{pagelink:TO, text: technisch ontwerp, anchor: SupportedSOPClasses}}). Deze termen kunnen gebruikt worden als weergavetekst in de PGO. 

| Naam SOP-klasse | SOP Class UID | Patiëntvriendelijke term |
| --- | --- | --- |
| Computed Radiography (CR) Image Storage | 1.2.840.10008.5.1.4.1.1.1 | Röntgenfoto |
| Digital X-Ray Image Storage – For Presentation | 1.2.840.10008.5.1.4.1.1.1.1 | Röntgenfoto |
| Digital Mammography X-Ray Image Storage – For Presentation | 1.2.840.10008.5.1.4.1.1.1.2 | Borstfoto |
| Computed Tomography (CT) Image Storage | 1.2.840.10008.5.1.4.1.1.2 | CT-scan |
| Enhanced Computed Tomography (CT) Image Storage | 1.2.840.10008.5.1.4.1.1.2.1 | CT-scan |
| Ultrasound Multi-frame Image Storage | 1.2.840.10008.5.1.4.1.1.3.1 | Echo |
| Magnetic Resonance (MR) Image Storage | 1.2.840.10008.5.1.4.1.1.4 | MRI-scan |
| Enhanced Magnetic Resonance (MR) Image Storage | 1.2.840.10008.5.1.4.1.1.4.1 | MRI-scan |
| Ultrasound Image Storage | 1.2.840.10008.5.1.4.1.1.6.1 | Echo |
| Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7 | Overig medisch beeld |
| Multi-frame Single Bit Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7.1 | Overig medisch beeld |
| Multi-frame Grayscale Byte Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7.2 | Overig medisch beeld |
| Multi-frame Grayscale Word Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7.3 | Overig medisch beeld |
| Multi-frame True Color Secondary Capture Image Storage | 1.2.840.10008.5.1.4.1.1.7.4 | Overig medisch beeld |
| X-Ray Angiographic Image Storage | 1.2.840.10008.5.1.4.1.1.12.1 | Röntgenfoto van bloedvaten |
| X-Ray Radiofluoroscopic Image Storage | 1.2.840.10008.5.1.4.1.1.12.2 | Bewegende röntgenbeelden |
| Nuclear Medicine Image Storage | 1.2.840.10008.5.1.4.1.1.20 | Scan met radioactieve stof |
| VL Endoscopic Image Storage | 1.2.840.10008.5.1.4.1.1.77.1.1 | Kijkonderzoek |
| Video Endoscopic Image Storage | 1.2.840.10008.5.1.4.1.1.77.1.1.1 | Kijkonderzoek |
| Encapsulated PDF Storage | 1.2.840.10008.5.1.4.1.1.104.1 | PDF-document |
| Positron Emission Tomography (PET) Image Storage | 1.2.840.10008.5.1.4.1.1.128 | PET-scan |
| Enhanced Positron Emission Tomography (PET) Image Storage | 1.2.840.10008.5.1.4.1.1.130 | PET-scan |

**Tabel 5: Patiëntvriendelijke termen SOP-klassen**

### Disclaimers
#### Downloaden van beelden
Het is wenselijk de gebruiker erop te attenderen dat bij het downloaden van een beeld een DICOM-viewer op het device geïnstalleerd dient te worden om het bestand te kunnen inzien. Door het ontwikkelen van een waarschuwing is het voor een gebruiker duidelijk wat de gevolgen zijn als een DICOM-bestand wordt gedownload.

Figuur 5 bevat een visuele weergave van hoe deze waarschuwing eruit zou kunnen komen te zien. In deze figuur is een waarschuwingsveld geplaatst onder de knop waarmee het beeld als DICOM-bestand kan worden gedownload. Dit waarschuwingsveld kan als uitklapmenu geopend worden met daarin de inhoudelijke tekst (zie Figuur 6).

{{render: guides/medmij-r4-image-availability-ig/images/Weergaverichtlijn waarschuwing downloaden beeld (knop).png}}

**Figuur 5: Voorbeeld van een waarschuwing voor het downloaden van een DICOM-beeld**

{{render: guides/medmij-r4-image-availability-ig/images/Weergaverichtlijn waarschuwing downloaden beeld (tekst).png}}

**Figuur 6: Voorbeeld van inhoudelijke tekst waarschuwing**

#### Niet volledig tonen van beeldenreeks
Bij het niet volledig tonen van een beeldenreeks is het advies om de gebruiker hierop te attenderen. Figuur 7 bevat een visuele weergave van hoe deze waarschuwing er per niet getoond beeld van een beeldenreeks uit zou kunnen zien. De vermelde SOP-klasse in deze waarschuwing kan door terugkoppeling van de eindgebruiker naar de PGO-leverancier of zorgaanbieder gebruikt worden voor verder onderzoek naar weergavemogelijkheden van het betreffende beeld.

{{render: guides/medmij-r4-image-availability-ig/images/Weergaverichtlijn waarschuwing onvolledige beeldenreeks.png}}

**Figuur 7: Voorbeeld van een waarschuwing bij niet tonen beeld uit beeldenreeks**