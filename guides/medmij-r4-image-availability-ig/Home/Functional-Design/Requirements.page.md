---
topic: Requirements
---

# Requirements

## Inleiding
Deze requirements zijn opgesteld voor de DVA's en PGO's in het kader van gegevensdienst Beeldbeschikbaarheid. De requirements beschrijven de minimale eisen waaraan voldaan moet worden om deze gegevensdienst correct te ondersteunen.

De prioriteit van elke onderstaande eis wordt vastgesteld volgens de MoSCoW-methodiek, waarbij eisen worden geclassificeerd op basis van hun belang en noodzaak voor de implementatie:

| Prioriteit | Omschrijving |
| --- | --- |
| M(ust have) | Nodig voor de basisfunctionaliteit van de toepassing en moet worden geïmplementeerd om het proces succesvol te laten verlopen. |
| S(hould have) | Belangrijke functionaliteit die niet vereist is, maar die voordelen biedt voor gebruikers en de algehele gebruikservaring. |
| C(ould have) | Gewenste functionaliteit die waarde toevoegt, maar minder kritisch is en indien nodig kan worden uitgesteld. |
| W(on't have) | Functionaliteiten die nu buiten scope zijn maar mogelijk in de toekomst worden overwogen. |

De eisen gemarkeerd met een 'M' vormen het absolute minimum: hieraan moet altijd worden voldaan door een DVA of PGO om gekwalificeerd te worden voor de gegevensdienst.

Naast de requirements is ook de {{pagelink: Weergaverichtlijn, text: weergaverichtlijn}} opgesteld. De requirements bevatten de minimale eisen waaraan een PGO moet voldoen en de weergaverichtlijn bestaat daaropvolgend uit visuele richtlijnen en UX-voorbeelden die aangeven hoe deze functionaliteit patiëntvriendelijk kan worden gepresenteerd.

## Eisen voor DVA
| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 1 | PGO-leverancier | Inzicht in de manier waarop rate limiting door de DVA is geconfigureerd | Een stabielere aansluiting op de DVA heb | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De DVA stelt documentatie beschikbaar waarin beschreven is hoe rate limiting is toegepast. |
| 2. | Als de limiet gespecificeerd door de DVA wordt overschreden door de PGO, wordt als response een HTTP 429 (Too Many Requests) gegeven op de request(s) van de PGO. |

## Eisen voor PGO
| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 1 | Zorggebruiker | Zo vroeg mogelijk in het proces geattendeerd worden dat mijn beelden het beste bekeken kunnen worden op een computerscherm | Begrijp dat mijn beelden op een groot scherm duidelijker getoond en beter beoordeeld kunnen worden dan op een mobiel of tablet, en dat ik mijn beelden niet onnodig op een ongeschikt apparaat ophaal | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt zo vroeg mogelijk in het proces een visueel duidelijke melding getoond, in ieder geval vóór het ophalen van beelden op de tijdlijn op mobiel of tablet (in zowel de webviewer als DICOM-download). |
| 2. | In de melding wordt een advies beschreven om de beelden op een computerscherm te bekijken. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 2 | Zorggebruiker | Inzage hebben in mijn beschikbare beelden en verslagen | Altijd een actueel overzicht van de beelden en verslagen van mijn zorgaanbieder(s) heb | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Elke keer dat het overzichtsscherm wordt geopend, wordt de tijdlijn van beelden en verslagen (opnieuw) opgehaald bij alle zorgaanbieders waarbij eerder beelden en verslagen zijn opgehaald. |
| 2. | Voor elk document (i.e. beeld of verslag) wordt basisinformatie getoond, namelijk: <br/> <ul> <li> onderzoeksdatum (VerrichtingStartDatum, bbs-dataelement-174); <li> type document; <li> naam onderzoek (BeeldTitel, bbs-medmij-dataelement-1; VerslagTitel, bbs-medmij-dataelement-2); <li> zorgaanbieder (OrganisatieNaam, bbs-dataelement-523); <li> uitvoerend zorgverlener (indien beschikbaar) (Uitvoerder.Zorgverlener.Naamgegevens (Voornamen/Initialen/Geslachtsnaam), bbs-dataelement-385); <li> type beeld (Modaliteit, bbs-medmij-dataelement-5). |
| 3. | Als de titel van het beeld of verslag ontbreekt, dan wordt dit expliciet vermeld in de betreffende overzichtsregel. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 3 | Zorggebruiker | Geïnformeerd worden dat er een vertraging kan zitten op de vrijgave van de beelden en verslagen van mijn onderzoek | Duidelijkheid heb over de variërende tijdsduur in beschikbaarheid van mijn beelden en verslagen | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt in het overzicht een visueel duidelijke melding getoond met daarin beschreven dat er een aantal dagen vertraging kan zitten op de vrijgave van de beelden en verslagen na onderzoeksdatum met een tijdsduur afhankelijk van betreffende zorgaanbieder(s). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 4 | Zorggebruiker | Beelden in de webviewer bekijken | Geen DICOM-viewer op mijn apparaat hoef te downloaden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Vanuit het overzicht in de PGO kan de gebruiker met één klik een viewer openen om beelden te bekijken. |
| 2. | Bij het uitvoeren van de requests aan de DVA wordt rekening gehouden met de door de DVA gespecificeerde rate limiting. |
| 3. | De gebruiker kan (rendered) DICOM-beelden bekijken zonder extra software te installeren. |
| 4. | De viewer werkt in gangbare webbrowsers en is bruikbaar op desktop, tablet en mobiel (responsive of mobiele variant). |
| 5. | De gebruiker krijgt duidelijke visuele feedback (bijvoorbeeld een laadindicator of wachtcursor met tekst) wanneer beelden worden geladen. |
| 6. | Indien mogelijk wordt de voortgang van het laden weergegeven in procenten of met een voortgangsbalk. |
| 7. | Als het laden langer duurt dan 60 seconden, dient de gebruiker te worden geïnformeerd. |
| 8. | De viewer opent in hetzelfde venster of in een herkenbare pagina binnen de PGO (geen verwarring met andere portalen). |
| 9. | De gebruiker kan in- en uitzoomen bij het bekijken van het beeld. |
| 10. | De gebruiker kan door verschillende beelden scrollen of deze afspelen als een filmpje wanneer een document meerdere beelden bevat (bijvoorbeeld bij een CT of MRI). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 5 | Zorggebruiker | Verslagen kunnen bekijken via de browser | Geen PDF-software op mijn apparaat hoef te downloaden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Verslagen zijn in de PGO te openen zonder externe PDF-viewer of door ze eerst te downloaden. |
| 2. | Verslagen zijn leesbaar op alle schermformaten (desktop, tablet, mobiel). |
| 3. | De gebruiker kan in- en uitzoomen bij het bekijken van het verslag. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 6 | Zorggebruiker | Beelden en verslagen die bij hetzelfde onderzoek horen, gekoppeld zien | Mijn uitslag (beeld en verslag samen) kan interpreteren om goed voorbereid te zijn op een vervolgconsult | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk verslag of beeld wordt automatisch gecontroleerd of er een bijbehorend gekoppeld document is (i.e. verslag bij beeld of beeld bij verslag). |
| 2. | Indien gekoppeld, worden deze gegevens samen weergegeven of duidelijk visueel gelinkt. |
| 3. | De koppeling gebeurt op basis van een gedeelde unieke identifier (AccessionNumber, bbs-medmij-dataelement-3). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 7 | Zorggebruiker | Beelden en verslagen op chronologische volgorde van onderzoeksdatum zien | Ik niet hoef te sorteren om het juiste beeld te vinden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Beelden en verslagen worden automatisch gesorteerd op onderzoeksdatum (VerrichtingStartDatum, bbs-dataelement-174), van meest recent naar minst recent. |
| 2. | De sortering kan handmatig worden gewijzigd. |
| 3. | De sortering blijft behouden bij filteracties door de gebruiker. |
| 4. | De onderzoeksdatum wordt zichtbaar getoond bij ieder verslag/beeld. |
| 5. | Indien twee documenten dezelfde onderzoeksdatum hebben, worden ze op tijdstip gesorteerd (indien beschikbaar). |
| 6. | De sortering blijft behouden na openen en sluiten van een beeld of verslag. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 8 | Zorggebruiker | Beelden en verslagen van meerdere zorgaanbieders in één overzicht kunnen bekijken | Ik in één oogopslag kan zien bij welke zorgaanbieders ik ben geweest en welke beelden en verslagen daar zijn opgevraagd | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Beelden en verslagen van meerdere zorgaanbieders worden in één gecombineerd overzicht weergegeven. |
| 2. | Elk document in het overzicht toont duidelijk de naam van de zorgaanbieder waar het onderzoek heeft plaatsgevonden. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 9 | Zorggebruiker | Beelden en verslagen kunnen filteren op basis van onderzoeksdatum | Snel de juiste onderzoeken kan zien | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De gebruiker kan een datumfilter instellen in het overzicht van beelden en verslagen (bijvoorbeeld via datumselectie, periode of jaar). |
| 2. | Het filter werkt op onderzoeksdatum (VerrichtingStartDatum, bbs-dataelement-174). |
| 3. | Er is standaard geen filter actief; alle documenten worden getoond tot de gebruiker zelf filtert. |
| 4. | Na toepassing van een filter wordt het overzicht direct bijgewerkt zonder paginaverversing. |
| 5. | De filtering blijft behouden na openen en sluiten van een beeld of verslag. |
| 6. | Beelden en verslagen blijven chronologisch gesorteerd binnen het filterresultaat. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 10 | Zorggebruiker | Beelden en verslagen kunnen doorzoeken | Snel de juiste onderzoeken kan zien | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Zoeken op (een deel van) de naam van het onderzoek in een zoekbalk is mogelijk. |
| 2. | Invoer in de zoekbalk filtert de rijen in realtime of na bevestiging (bijvoorbeeld Enter-toets). |
| 3. | Invoer in de zoekbalk filtert de rijen op basis van deels overeenkomende waarden in de kolommen ('contains'). |
| 4. | De zoekterm wordt niet hoofdlettergevoelig behandeld (i.e. zoeken is case insensitive). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 11 | Zorggebruiker | Beelden kunnen downloaden in het originele bestandsformaat via een knop in mijn PGO | Zelf beschikking heb over mijn beelden en deze kan delen met andere zorgverleners of bewaren voor mijn eigen administratie | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk beschikbaar beeld is een duidelijke knop zichtbaar met het label 'Download beeld'. |
| 2. | De gebruiker kan kiezen om dit op te slaan in: <br/> <ul> <li> [DICOM-formaat](https://dicom.nema.org/medical/dicom/2018d/output/html/part10.html) (standaard voor beelden); <li> JPEG-formaat (voor persoonlijk gebruik of eenvoudige weergave). |
| 3. | Wanneer de gebruiker kiest voor het originele formaat (DICOM), wordt een melding getoond met: <br/> <ul> <li> de aanduiding dat het om een DICOM-bestand gaat; <li> een korte uitleg dat voor het openen van dit bestand een geschikte viewer nodig is; <li> een waarschuwing dat het bestand persoonlijke data bevat; <li> de verwachte bestandsgrootte (MB/GB). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 12 | Zorggebruiker | Verslagen van beelden kunnen downloaden via een knop in mijn PGO | Zelf beschikking heb over mijn verslagen | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk beschikbaar verslag is een duidelijke knop zichtbaar met het label 'Download verslag'. |
| 2. | Verslagen zijn te downloaden als PDF-bestand. |
| 3. | Na het klikken op de downloadknop ontvangt de gebruiker visuele feedback, bijvoorbeeld een melding 'Download gestart' of 'Verslag opgeslagen'. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 13 | Zorggebruiker | Beelden en verslagen kunnen filteren op basis van zorgaanbieder | Ik snel gegevens van een specifieke zorgverlener kan bekijken | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De gebruiker ziet een filter waarin de beschikbare zorgaanbieders worden weergegeven. |
| 2. | Na selectie van een zorgaanbieder worden alleen de bijbehorende beelden en verslagen getoond in het overzicht. |
| 3. | In de lijst van beelden en verslagen is duidelijk aangegeven welke zorgaanbieder het document heeft aangeleverd. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 14 | Zorggebruiker | Bij het beeld en verslag de betrokken zorgverlener(s) zien indien beschikbaar gesteld door de zorgaanbieder | Weet welke zorgverlener verantwoordelijk is voor de informatie | C |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk beeld of verslag wordt de beschikbaar gestelde naam en/of het specialisme van de uitvoerende zorgverlener (bbs-dataelement-187) getoond. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 15 | Zorggebruiker | Geattendeerd worden op het risico van mogelijke onjuiste interpretatie van de beelden en verslagen | Een zo juist mogelijke interpretatie van de beelden en verslagen heb | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt in het overzicht van beelden en verslagen eenmalig de volgende disclaimer getoond: <br/> <br/> *Uw behandelend specialist heeft de beelden of de uitslag misschien nog niet bekeken of met u besproken.* <br/> *De informatie kan soms moeilijk te begrijpen zijn.* <br/> *Zonder extra uitleg kunt u de informatie verkeerd begrijpen.* <br/> *Bespreek uw vragen met uw behandelend specialist.* |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 16 | Zorggebruiker | Geattendeerd worden wanneer een beeldenreeks niet volledig wordt getoond | Begrijp dat er een beeld ontbreekt en door de onvolledigheid van de beschikbare informatie er een risico is op onjuiste interpretatie | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt een visueel duidelijke foutmelding getoond bij het niet volledig tonen van een beeldenreeks in zowel de webviewer als DICOM-download. |
| 2. | In de foutmelding wordt opgenomen met wie de gebruiker contact kan opnemen. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 17 | Zorggebruiker | Dat beelden die onderdeel uitmaken van dezelfde serie op de juiste volgorde worden getoond | Een dergelijke reeks van beelden correct kan interpreteren | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Alle opgehaalde beelden van een serie worden op dezelfde volgorde als in het bijbehorende DICOM KOS-document getoond of afgespeeld. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 18 | Zorggebruiker | Dat frames die onderdeel uitmaken van hetzelfde beeld op de juiste volgorde worden getoond | Een dergelijk beeld correct kan interpreteren | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Alle opgehaalde frames van een beeld worden op numerieke volgorde van de bijbehorende framenummers getoond of afgespeeld. |