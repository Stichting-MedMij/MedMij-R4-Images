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

Naast de requirements is ook de {{pagelink:Weergaverichtlijn, text: weergaverichtlijn}} opgesteld. De requirements bevatten de minimale eisen waaraan een PGO moet voldoen en de weergaverichtlijn bestaat daaropvolgend uit visuele richtlijnen en UX-voorbeelden die aangeven hoe deze functionaliteit patiëntvriendelijk kan worden gepresenteerd.

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
| 1 | Zorggebruiker | Beelden in de webviewer bekijken | Geen DICOM-viewer op mijn apparaat hoef te downloaden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Vanuit het overzicht in de PGO kan de gebruiker met één klik een viewer openen om beelden en/of verslagen te bekijken. |
| 2. | Bij het uitvoeren van de requests aan de DVA wordt rekening gehouden met de door de DVA gespecificeerde rate limiting. |
| 3. | De gebruiker kan (rendered) DICOM-beelden bekijken zonder extra software te installeren. |
| 4. | De viewer werkt in gangbare webbrowsers en is bruikbaar op desktop, tablet en mobiel (responsive of mobiele variant). |
| 5. | De gebruiker krijgt duidelijke visuele feedback (bijvoorbeeld een laadindicator of wachtcursor met tekst) wanneer beelden worden geladen. |
| 6. | Indien mogelijk wordt de voortgang van het laden weergegeven in procenten of met een voortgangsbalk. | 
| 7. | Als het laden langer duurt dan 60 seconden, dient de gebruiker te worden geïnformeerd. |
| 8. | De viewer opent in hetzelfde venster of in een herkenbare tab/pagina binnen de PGO (geen verwarring met andere portalen). | 

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 2 | Zorggebruiker | Verslagen kunnen bekijken via de browser | Geen PDF-software op mijn device hoef te downloaden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Verslagen zijn in de PGO te openen zonder externe PDF-viewer of door ze eerst te downloaden. |
| 2. | Verslagen zijn leesbaar op alle schermformaten (desktop, tablet, mobiel). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 3 | Zorggebruiker | Beelden en verslagen die bij hetzelfde onderzoek horen, gekoppeld zien | Mijn uitslag (beeld en verslag samen) kan interpreteren om goed voorbereid te zijn op een vervolgconsult | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk verslag of beeld wordt automatisch gecontroleerd of er een bijbehorend gekoppeld item is (i.e. verslag bij beeld of beeld bij verslag). |
| 2. | Indien gekoppeld, worden deze gegevens samen weergegeven of met een duidelijke visuele link. |
| 3. | De koppeling gebeurt op basis van een gedeelde unieke identifier (Accession Number). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 4 | Zorggebruiker | Beelden en verslagen op chronologische volgorde van uitvoerdatum zien | Ik niet hoef te sorteren om het juiste beeld te vinden | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Beelden en verslagen worden automatisch gesorteerd op uitvoerdatum, van meest recent naar minst recent. |
| 2. | De sortering kan handmatig worden gewijzigd. |
| 3. | De sortering blijft behouden bij filteracties door de gebruiker. |
| 4. | Datum van uitvoering wordt zichtbaar getoond bij ieder verslag/beeld. |
| 5. | Indien twee items dezelfde datum hebben, worden ze op tijdstip gesorteerd (indien beschikbaar). |
| 6. | De sortering blijft behouden na openen en sluiten van een beeld of verslag. | 

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 5 | Zorggebruiker | Beelden en verslagen van meerdere zorgaanbieders in één overzicht kunnen bekijken | Ik in één oogopslag kan zien bij welke zorgaanbieders ik ben geweest en welke beelden en verslagen daar zijn opgevraagd | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Beelden en verslagen van meerdere zorgaanbieders worden in één gecombineerd overzicht weergegeven. |
| 2. | Elk item in het overzicht toont duidelijk de naam van de zorgaanbieder waar het onderzoek heeft plaatsgevonden. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 6 | Zorggebruiker | Beelden en verslagen kunnen filteren op basis van datum | Snel de juiste onderzoeken kan zien | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De gebruiker kan een datumfilter instellen in het overzicht van beelden en verslagen (bijvoorbeeld via datumselectie, periode of jaar). |
| 2. | Het filter werkt op VerrichtingStartDatum (bbs-dataelement-174). |
| 3. | Er is standaard geen filter actief; alle items worden getoond tot de gebruiker zelf filtert. |
| 4. | Na toepassing van een filter wordt het overzicht direct bijgewerkt zonder paginaverversing. | 
| 5. | De filtering blijft behouden na openen en sluiten van een beeld of verslag. | 
| 6. | Beelden en verslagen blijven chronologisch gesorteerd binnen het filterresultaat. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 7 | Zorggebruiker | Beelden en verslagen kunnen doorzoeken | Snel de juiste te onderzoeken kan zien | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Invoer in de zoekbalk filtert de rijen in realtime of na bevestiging (bijvoorbeeld Enter-toets). |
| 2. | Invoer in de zoekbalk filtert de rijen op basis van deels overeenkomende waarden in de kolommen ('contains'). |
| 3. | De zoekterm wordt niet hoofdlettergevoelig behandeld (i.e. zoeken is case insensitive). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 8 | Zorggebruiker | Beelden kunnen downloaden in het originele bestandsformaat via een duidelijke button op mijn device | Zelf beschikking heb over mijn beelden en deze kan delen met andere zorgverleners of bewaren voor mijn eigen administratie | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De gebruiker ziet bij elk beschikbaar beeld of onderzoek een duidelijke downloadknop. |
| 2. | De gebruiker kan kiezen om dit op te slaan in: <br/> <ul> <li> [DICOM-formaat](https://dicom.nema.org/medical/dicom/2018d/output/html/part10.html) (standaard voor beelden); <li> JPEG-formaat (voor persoonlijk gebruik of eenvoudige weergave). |
| 3. | Wanneer de gebruiker kiest voor het originele formaat (DICOM), wordt een melding getoond met: <br/> <ul> <li> de aanduiding dat het om een DICOM-bestand gaat; <li> een korte uitleg dat voor het openen van dit bestand een geschikte viewer nodig is; <li> een waarschuwing dat het bestand persoonlijke data bevat; <li> de verwachte bestandsgrootte (MB/GB). |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 9 | Zorggebruiker | Verslagen van beelden kunnen downloaden via een button op mijn device | Zelf beschikking heb over mijn verslagen | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk beschikbaar verslag is een duidelijke knop zichtbaar met het label 'Download verslag'. |
| 2. | Verslagen zijn te downloaden als PDF-bestand. |
| 3. | Na het klikken op de downloadknop ontvangt de gebruiker visuele feedback, bijvoorbeeld een melding 'Download gestart' of 'Verslag opgeslagen'. | 

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 10 | Zorggebruiker | Wil ik beelden en verslagen kunnen filteren op basis van zorgaanbieder | Ik snel gegevens van een specifieke zorgverlener kan bekijken | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | De gebruiker ziet een filter waarin de beschikbare zorgaanbieders worden weergegeven. |
| 2. | Na selectie van een zorgaanbieder worden alleen de bijbehorende beelden en verslagen getoond in het overzicht. |
| 3. | In de lijst van beelden en verslagen is duidelijk aangegeven welke zorgaanbieder het item heeft aangeleverd. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 11 | Zorggebruiker | Bij het beeld en verslag de betrokken zorgverlener(s) zien indien beschikbaar gesteld door zorgaanbieder | Weet welke zorgverlener verantwoordelijk is voor de informatie | C |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Bij elk beeld of verslag wordt de beschikbaar gestelde naam en/of het specialisme van de uitvoerende zorgverlener (bbs-dataelement-187) getoond. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 12 | Zorggebruiker | Geattendeerd worden op het risico van mogelijke onjuiste interpretatie van de beelden en verslagen | Een zo juist mogelijke interpretatie van de beelden en verslagen heb | M |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt in het overzicht van beelden en verslagen eenmalig de volgende disclaimer getoond: <br/> <br/> *Uw behandelend specialist heeft de beelden of de uitslag misschien nog niet bekeken of met u besproken.* <br/> *De informatie kan soms moeilijk te begrijpen zijn.* <br/> *Zonder extra uitleg kunt u de informatie verkeerd begrijpen.* <br/> *Bespreek uw vragen met uw behandelend specialist.* |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 13 | Zorggebruiker | Geattendeerd worden wanneer een beeldenreeks niet volledig wordt getoond | Begrijp dat er een beeld ontbreekt en door de onvolledigheid van de beschikbare informatie er een risico is op onjuiste interpretatie | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Er wordt een visueel duidelijke foutmelding getoond bij het niet volledig tonen van een beeldenreeks in zowel de webviewer als DICOM-download. |
| 2. | In de foutmelding wordt opgenomen met wie de gebruiker contact kan opnemen. |

| ID | Als (rol) | Wil ik (functie) | Zodat ik (doel) | Prioriteit (MoSCoW) |
| --- | --- | --- | --- | --- |
| 14 | Zorggebruiker | Dat frames die onderdeel uitmaken van hetzelfde beeld op de juiste volgorde worden getoond | Een dergelijk beeld correct kan interpreteren | S |

| Acceptatiecriteria | Beschrijving |
| --- | --- |
| 1. | Alle opgehaalde frames van een beeld worden op numerieke volgorde van de bijbehorende framenummers getoond of afgespeeld. |