---
topic: Deduplicatierichtlijn
---

# Deduplicatierichtlijn

## Inleiding en doel
Deze richtlijn beschrijft het proces van duplicaatdetectie binnen de gegevensdienst Beeldbeschikbaarheid. Het doel is het voorkomen van dubbele verslagen en beelden die door verschillende bronsystemen aan een PGO beschikbaar worden gesteld. Door inconsistent gebruik van (unieke) identificatienummers bij hergebruik van gegevens over instellingen heen, kunnen dubbele documenten ontstaan. Deze richtlijn helpt om dergelijke duplicatie te herkennen en, waar mogelijk, verhelderend aan de burger te tonen.

Er bestaan op dit moment geen overkoepelende nationale richtlijnen voor het uniek identificeren van medische beelden of verslagen. Deze richtlijn dient daarom als tijdelijke handreiking aan leveranciers en zorgaanbieders.

## Duplicaatdetectie
Duplicaatdetectie is het proces waarbij kopieën van gegevens worden geïdentificeerd. In de ideale situatie stelt elke zorgverlener uitsluitend zijn eigen beelden en verslagen beschikbaar. In de praktijk blijkt dit echter lastig door het ontbreken van domeinoverstijgende afspraken. Duplicaatdetectie via automatische detectie op basis van unieke kenmerken, is daarom noodzakelijk, zodat er voor de burger een bruikbaar en leesbaar overzicht van gegevens in de PGO wordt weergegeven.

In het {{pagelink: TD, text: technisch ontwerp, anchor: Identifiers}} is een overzicht weergegeven van alle relevante identificatienummers voor de uitwisseling van beelden en verslagen. In het bijzonder bevat dit overzicht extra toelichting voor de identificatienummers die gebruikt worden voor duplicaatdetectie.

## Detectie en identificatie duplicaten

### Verslagen
Duplicaatdetectie van verslagen gebeurt op basis van:
- VerslaginformatieIdentificatienummer ([Nictiz BBS dataset (1.0.0-alpha.2)](https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html), bbs-dataelement-100): het unieke ID van het verslag in een XIS.

Als twee verslagen een identiek VerslaginformatieIdentificatienummer hebben, kan worden aangenomen dat deze verslagen duplicaten zijn.

### Beelden
Duplicaatdetectie van medische beelden gebeurt op basis van:
- Study Instance UID ({{pagelink: LM, text: MedMij dataset}}, bbs-medmij-dataelement-4): het unieke identificatienummer van een beeldvormend onderzoek binnen DICOM.
- BeeldinformatieIdentificatienummer ([Nictiz BBS dataset (1.0.0-alpha.2)](https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html), bbs-dataelement-784): het unieke ID van het beeld in een PACS of NVA.

Als twee beelden een identiek Study Instance UID hebben, kan worden aangenomen dat deze beelden duplicaten zijn. Mocht het Study Instance UID leeg zijn bij (één van) de beelden, dan moet het BeeldinformatieIdentificatienummer van beide beelden vergeleken worden. Als deze laatste identificatienummers in dat geval identiek zijn, kan worden aangenomen dat de betreffende beelden duplicaten zijn.

Bovenstaande geldt ook voor de duplicaatdetectie van series van beelden.

**Let op:** Hoewel het Study Instance UID bedoeld is als een wereldwijd uniek identificatienummer van een beeldvormend onderzoek, is het in de praktijk vaak alleen uniek binnen het originele PACS. Bij import in een ander systeem (zoals een ander ziekenhuis) wordt mogelijk een nieuw UID gegenereerd.

## Weergave duplicaten
Voor het weergeven van duplicaten is het gewenst om deze te groeperen in het overzicht van beelden en verslagen in de PGO. Hierbij kan worden gedacht aan een uitklapmenu voor elke groep van duplicaten, waar bij het openklappen alle duplicaten zichtbaar worden.