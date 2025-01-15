<script lang='ts'>
    /*  Login page simulated the login authentication step with a PGO. */
    import { PATHS } from '../config/paths';
    import { authStore, login, logout } from '../stores/auth-store';
    import { navigate } from 'svelte-routing';
    import { base } from '../stores/baseurl-store';
</script>

<section>
    {#if !$authStore.loggedIn}
        <h2>Inloggen bij PGO</h2>
        <p>Je bent nog niet ingelogd. Log in op de identity provider van demo PGO.</p>
        <p>In deze stap simuleren we het inloggen op een PGO-website. Doorgaans volgt daarna een stap om met DigiD te identificeren bij zorgaanbieders en informatie op te halen uit patiëntdossiers.</p>
        <button class="iconbutton" on:click={() => login()}><i class="fa fa-sign-in"></i> Inloggen</button>
        <button class="iconbutton" disabled><i class="fa-solid fa-exchange"></i> Gegevens uitwisselen</button>
    {:else}
        <h2>Inloggen bij PGO <i class="fa fa-check green"></i></h2>
        <p>Je bent ingelogd als <b>{$authStore.username}</b>. Haal nu gegevens op van zorgaanbieders. Kies voor <i>gegevens uitwisselen</i> en bekijk je zorgdossier. Haalde je eerder al gegevens op, dan kun je die meteen bekijken. De persoonlijke gezondheidsomgeving zorgt er voor dat jij levenslang persoonlijke medische gegevens kunt verzamelen.</p>
        <button class="iconbutton" on:click={() => logout()}><i class="fa fa-sign-in"></i> Uitloggen</button>
        <button class="iconbutton" on:click={() => navigate($base + PATHS.IMPORT)}><i class="fa-solid fa-exchange"></i> Gegevens uitwisselen</button>
    {/if}

</section>


<style lang="scss">

    section {
        padding: 3em;
        width: 900px;
    }

    .green {
        color: green;
    }

</style>
