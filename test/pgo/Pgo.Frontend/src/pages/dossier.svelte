<script lang='ts'>
    /*  Dossier page is a component simulating a tabbed view of a patient's medical record.
        Two concepts shown: a tab with a timeline and two tabs with tables for reports and images.
    */
    import { navigate } from 'svelte-routing';
    import { PATHS } from '../config/paths';
    import { collapseMenus } from '../stores/app-store';
    import { authStore, login, logout } from '../stores/auth-store';
    import { get } from 'svelte/store';
    import { base } from '../stores/baseurl-store';
    import DossierTable from '../components/dossier/DossierTable.svelte';
    import DossierTimeline from '../components/dossier/DossierTimeline.svelte';

    export let activeTab = PATHS.DOSSIER_TIMELINE;
    collapseMenus.set(false);
</script>

<section>
    <h2>Mijn zorgdossier</h2>
    {#if !$authStore.loggedIn}
        <p>Je bent nog niet ingelogd.</p>
        <button class="iconbutton" on:click={() => login()}><i class="fa fa-sign-in"></i> Inloggen</button>
    {:else}

        <!-- Quick draft: let's move to tab control. -->

        <div class="tab">
            <button class="tablinks" on:click="{() => navigate(`${get(base)}${PATHS.DOSSIER}/${activeTab = PATHS.DOSSIER_TIMELINE}`, { replace: true })}" class:active={activeTab == PATHS.DOSSIER_TIMELINE}>Tijdlijn</button>
            <button class="tablinks" on:click="{() => navigate(`${get(base)}${PATHS.DOSSIER}/${activeTab = PATHS.DOSSIER_REPORTS}`, { replace: true })}" class:active={activeTab == PATHS.DOSSIER_REPORTS}>Verslagen</button>
            <button class="tablinks" on:click="{() => navigate(`${get(base)}${PATHS.DOSSIER}/${activeTab = PATHS.DOSSIER_IMAGES}`, { replace: true })}" class:active={activeTab == PATHS.DOSSIER_IMAGES}>Beelden</button>
        </div>
        <div class="tabcontent" class:active={activeTab == PATHS.DOSSIER_TIMELINE}>
            <DossierTimeline />
        </div>
        
        <div class="tabcontent" class:active={activeTab == PATHS.DOSSIER_REPORTS}>
            <DossierTable typeCode="REPORTS" />
        </div>
        
        <div class="tabcontent" class:active={activeTab == PATHS.DOSSIER_IMAGES}>
            <DossierTable typeCode="IMAGES" />
        </div>       
        
    {/if}
</section>

<style lang="scss">

    section {
        padding: 3em;
        width: 900px;
    }

    .tab {
        overflow: hidden;
        border-bottom: 1px solid #ccc;
        background-color: #f1f1f1;

        button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 0;
            margin: 0 30px;
            transition: 0.3s;
            font-family: 'Montserrat', sans-serif;
            font-weight: 400;
            font-size: 1em;
            line-height: 1.5;

            &:hover {
                border-bottom: 4px solid #333;
            }

            &.active {
                font-weight: 700;
                // background-color: #ccc;
                border-bottom: 4px solid #333;
            }
        }
    }

    .tabcontent {
        display: none;
        padding: 6px 12px;
        border-top: none;

        &.active {
            display: block;
        }
    }

</style>
