<script lang='ts'>
    /*  Information page (Uitleg) shows additional information on imaging format as a demo. */
    import '@fortawesome/fontawesome-free/css/all.min.css'
</script>

<section>
    <div class="content">
        <h2>Beeld in PGO</h2>

        <h3>Hoe zorgaanbieders beelden ontsluiten</h3>
        <p>Zorgaanbieders bewaren radiologische bestanden (ook wel beeldvormingsbestanden of radiologiebeelden) in een digitaal formaat langs de <a href="https://nl.wikipedia.org/wiki/DICOM" target="_blank">DICOM</a>-standaarden <i>(digital imaging and communications in medicine)</i>. Ook in Nederland wordt dit formaat gebruikt voor medische beeldvorming in bijvoorbeeld:</p>
        <ul>
            <li><b>Röntgenfoto's</b> (X-ray)</li>
            <li><b>CT-scans</b> (Computed Tomography)</li>
            <li><b>MRI-scans</b> (Magnetic Resonance Imaging)</li>
            <li><b>Echografie</b> (Ultrasound)</li>
        </ul>

        <p>De DICOM-bestanden staan op een beeldverwerkend systeem <a href="https://nl.wikipedia.org/wiki/Picture_Archiving_and_Communication_System" target="_blank">PACS</a> <i>(picture archiving and communication system)</i>. De bestanden zelf en de serveromgeving omvatten metadata, zoals patiëntinformatie en technische gegevens over de opname. Sommige van die gegevens zijn overgenomen in het FHIR-bericht en in het verslag, andere inzichtelijk na het downloaden van een .DCM-bestand.</p>

        <h3>Beelden en verslagen uitwisselen</h3>
 
        <p>Voor het tonen van een zorgdossier is er uitwisseling van beeldverwijzingen met zorgaanbieders (HTTP FHIR). Op een later moment kan PGO beelden (HTTP DICOMweb) en verslagen (HTTP GET) ophalen wanneer de patiëntgebruiker deze wil inzien.</p>
        <ul>
            <h4>1. Beeldverwijzingen uitwisselen</h4>
            <p>Met een FHIR-verzoek vraagt PGO een bundel <a href="https://hl7.org/fhir/r4/documentreference.html" target="_blank">DocumentReference</a> uit het patientdossier bij zorgaanbieder. De FHIR-verwijzingen bevatten metadata over een beeld of rapport, zoals de titel, grootte, type en aanmaakdatum. De PGO toont deze documentenreeks in een overzicht. MedMij doet verschillende suggesties over de vorm en weergave in een tijdlijn en doorzoekbare verzamellijsten om het concept toe te lichten.</p>
            
            <h4>2. Beeldreeksen zoeken. Verslagen en beelden ophalen</h4>
            <p>Beeldverwijzingen in FHIR verwijzen naar beelden, beeldreeksen en verslagen in een PACS-omgeving. Het PGO haalt deze beeldbestanden met <a href="https://en.wikipedia.org/wiki/DICOMweb" target="_blank">DICOMweb API's</a> op (QIDO-RS en WADO-RS) zodra de gebruiker ze wil inzien. Verslagen zijn als PDF-document uit het PACS op te halen met HTTP GET (zonder DICOMweb).</p>

            <h4>3. Verslagen tonen</h4>
            <p>In het PGO vind je gezondheidsgegevens en verschillende medische verslagen. In de afsprakenset Beeldbeschikbaarheid komen beeldverslagen als <a href="https://nl.wikipedia.org/wiki/Portable_document_format" target="_blank">PDF-bestand</a>. Deze documenten zijn in praktisch in <a href="https://caniuse.com/?search=pdf" target="_blank">alle populaire browsers</a> te lezen met een ingebouwde viewer zonder aanvullende software als Adobe Acrobat. De PGO kan de PDF-bestanden ook in een eigen viewer tonen, bijvoorbeeld zoals in dit protype.</p>
        </ul>

        <h3>Hoe PGO's beelden tonen</h3>
        <p>Vanuit technisch oogpunt zijn er met DICOMweb <a href="https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri/" target="_blank">verschillende opties</a> voor een PGO om beelden en verslagen bij een aanbieder op te halen. Zoals het kunnen downloaden van het origineel, chunks streamen, rendered resoluties, frames ophalen. Enkele varianten zijn vereist of gewenst, uitgewerkt in het ontwerp. In de basis komt het er op neer dat patiëntgebruikers de beeldinformatie op een prettige manier in de browser moeten kunnen zien met een optie voor het inzien van volledige details, zonder dat hier aanvullende software voor nodig is en alleen bewaren op de harde schijf als de gebruiker daar expliciet om vraagt.</p>

        <p>Gebruiker van de PGO kan beelden downloaden, streamen met een DICOM-viewer. PGO kan er ook voor kiezen om kopieën van grote beelden aan te bieden, de originelen kleiner te maken op een manier die goed past bij de gebruikservaring op het PGO. Een gebruiker die werkt op een mobiele telefoon heeft baat bij een lagere resolutie en minder beelddetailinformatie, dan een gebruiker die op een grote monitor en een snelle internetverbinding weergeeft.</p>

        
        <h3>Beelden buiten PGO gebruiken</h3>
        <p>PGO's hebben een DICOM-viewer ingebouwd om beelden te bekijken. Als gebruiker van het PGO heb je daarnaast de optie om de bestanden in .DCM-formaat te downloaden. De bestanden komen dan in de downloadmap van je browser terecht waar je ze kunt openen met een DICOM-programma voor Windows, MacOS of Linux. Het is ook mogelijk het bestand mee te nemen naar een arts. Enkele populaire DICOM-viewers die je lokaal op de computer kunt installeren om de beeldbestanden te bekijken:</p>
        <ul>
            <li><a href="https://www.osirix-viewer.com/" target="_blank">OsiriX</a> (MacOS)</li>
            <li><a href="https://www.radiantviewer.com/" target="_blank">RadiAnt DICOM Viewer</a> (Windows)</li>
            <li><a href="https://www.santesoft.com/en/products/sante-dicom-viewer-free" target="_blank">Sante DICOM Viewer</a> (Windows, macOS, Linux)</li>
            <li><a href="https://www.microdicom.com/" target="_blank">MicroDicom</a> (Windows)</li>
            <li><a href="https://www.ambrahealth.com/viewer/" target="_blank">Ambra Health DICOM Viewer</a> (Windows, macOS, Linux)</li>
        </ul>
    </div>
</section>

<style lang="scss">

    section {
        padding: 3em;
        width: 900px;
        display: grid;
        grid-template-rows: auto 1fr auto;
    }

</style>
