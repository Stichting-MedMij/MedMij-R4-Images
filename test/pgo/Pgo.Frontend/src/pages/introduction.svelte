<script lang='ts'>
    /*  Introduction page shows welcome information for demo and scenario use-case testing. */
    import { PATHS } from '../config/paths';
    import { navigate } from 'svelte-routing';
    import { get } from 'svelte/store';
    import { base } from '../stores/baseurl-store';
    import logo from '../assets/images/logo.png';
    import example1 from '../assets/images/example1.png';
    import example2 from '../assets/images/example2.png';
    import '@fortawesome/fontawesome-free/css/all.min.css'
    import { authStore, login } from '../stores/auth-store';
</script>

<section>
    <div class="content">
        <h2>Raadplegen beeld en verslag in persoonlijke gezondheidsomgeving <small>(MedMij R4 Images IG 0.1.0-poc)</small></h2>
        <p>Deze demontratie simuleert het verzamelen en presenteren van beeldmateriaal en -verslagen bij zorgaanbieders voor een patiënt. De patiëntgebruiker logt in op een PGO dat een dossier aanlegt met beeldinformatie van meerdere zorgaanbieders. De beeldinformatie omvat verwijzingen naar beelden en rapporten (FHIR), maar de PGO bewaart niet per se de beelden en rapporten zelf.</p>
        <p>Beeldvormingsbestanden zijn doorgaans groot. Beeldservers (PACS, DICOM) bij de zorgaanbieder zijn in staat grote beelden op verzoek uit te leveren of hiervan delen te sturen. Voor het bekijken in een browser is het vaak voldoende om beelden in delen of op lagere resolutie te tonen tot detailinformatie gewenst is. Voorwaarde is dat de patiënt kan beschikken over het origineel.</p>
        <p>
            <a href={example1} class="example example1" target="_blank"><img src={example1} alt="Zorgdossier met beeldverwijzigingen."></a>
            <a href={example2} class="example example2" target="_blank"><img src={example2} alt="Beelden bekijken met DICOM-viewer."></a>
        </p>
        <p><small>NB: Dit is een conceptuitwerking beeldbeschikbaarheid. MedMij gebruikt dit prototype bij het valideren van <a href="https://simplifier.net/guide/medmij-r4-images-ig/Home/Functional-design.page.md">use-cases beeld-en-verslag PGO</a> voor de persoon in relatie tot de informatiestandaard <a href="https://informatiestandaarden.nictiz.nl/wiki/Landingspagina_Beeldbeschikbaarheid" target="_blank">Beeldbeschikbaarheid, versie 1.0.0-alpha.2</a>.</small></p>
        <button class="iconbutton" on:click={() => navigate(`${get(base)}${PATHS.INFORMATION}`)}><i class="fa fa-circle-info"></i> Uitleg over bekijken</button>
        {#if !$authStore.loggedIn}
            <button class="iconbutton" on:click={() => login(`${get(base)}${PATHS.LOGIN}`)}><i class="fa fa-sign-in"></i> Inloggen</button>
        {:else}
            <button class="iconbutton" on:click={() => navigate(`${get(base)}${PATHS.DOSSIER}`)}><i class="fa-solid fa-notes-medical"></i> Open zorgdossier</button>
        {/if}
    </div>
    <img src={logo} class="logo" alt="MedMij-logo">
</section>




<style lang="scss">

    section {
        padding: 3em;
        width: 900px;
        display: grid;
        grid-template-rows: auto 1fr auto;
        height: 100%;
    }

    img.logo {
        width: 130px;
        justify-self: last baseline;
        padding-top: 2rem;
    }

    a.example {
        img {
            width: 340px;        
            opacity: 0.7;
        }

        &:hover img {
            opacity: 1;
        }

        &.example1 img {
            margin: 50px 50px 0 0;
        }

        &.example2 img {
            margin: 50px 0 0 0;
        }
    }

    h2 small {
        font-size: 0.4em;
        font-weight: 400;
        font-style: italic;
        color: #666;
    }

</style>
