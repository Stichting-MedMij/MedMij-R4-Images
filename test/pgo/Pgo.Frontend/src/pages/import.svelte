<script lang="ts">
    /*  Import page simulated the retrieval step of a patient's medical record from a healthcare provider.
        PGOs have this built-in. For given scenario's PGO would retrieve a bundle of DocumentReference resources.
    */
    import { PATHS } from '../config/paths';
    import { navigate } from 'svelte-routing';
    import { get } from 'svelte/store';
    import { base } from '../stores/baseurl-store';
    import { authStore, login } from '../stores/auth-store';
    import { dossierStore, importDocumentReferences, resetDocumentReferences } from '../stores/dossier-store';

    let isFading = false;

    function import_animate() {
      isFading = true;
      importDocumentReferences();
      setTimeout(() => {
        isFading = false;
      }, 2000);
    }

</script>

<section>
  <h2>Uitwisselen met zorgaanbieder</h2>
  {#if !$authStore.loggedIn}
    <p>Je bent nog niet ingelogd.</p>
    <button on:click={() => login()}><i class="fa fa-sign-in"></i> Inloggen</button>
  {:else}
    <p>Voor het PGO je zorgdossier kan tonen, haalt het eerst je zorginformatie op uit zorgaanbieders. Voor beeldmateriaal haalt het PGO de beschikbare <i>DocumentReference</i> op voor een patient, deze 'lichte' informatie bewaart het PGO. Verslagen en beelden zijn zwaarder en worden op aanvraag bij een DICOM-server van de zorgaanbieder opgehaald en doorgaans niet in het PGO bewaard.</p>
    <!-- <p>Met een FHIR-verzoek vraagt PGO een bundel <a href="https://hl7.org/fhir/r4/documentreference.html" target="_blank">DocumentReference</a> uit het patientdossier bij zorgaanbieder. De FHIR-verwijzingen bevatten metadata over een beeld of rapport, zoals de titel, grootte, type en aanmaakdatum. De PGO toont deze documentenreeks in een overzicht. MedMij doet suggesties over de vorm en weergave in een tijdlijn en in lijsten.</p> -->
    <div class="actions" class:fade={isFading}>
      {#if $dossierStore.documentReferenceContentItems.length === 0}
        <p>Je hebt nog geen medische gegevens opgehaald bij een zorgaanbieder.</p>
        <button class="iconbutton" on:click={import_animate}><i class="fa-solid fa-exchange"></i> Gegevens uitwisselen</button>
        <button class="iconbutton" disabled><i class="fa-solid fa-arrow-rotate-left"></i> Reset</button>
        <button class="iconbutton" disabled><i class="fa-solid fa-notes-medical"></i> Open zorgdossier</button>
      {:else}
        <p>Je hebt gegevens opgehaald bij een zorgaanbieder.</p>
        <button class="iconbutton" on:click={import_animate}><i class="fa-solid fa-exchange"></i> Meer gegevens uitwisselen</button>
        <button class="iconbutton" on:click={() => resetDocumentReferences()}><i class="fa-solid fa-arrow-rotate-left"></i> Reset</button>
        <button class="iconbutton" on:click={() => navigate(`${get(base)}${PATHS.DOSSIER}`)}><i class="fa-solid fa-notes-medical"></i> Open zorgdossier</button>
      {/if}
    </div>
    <p class="total" class:fade={isFading}>In je zorgdossier staan <b>{$dossierStore.documentReferenceContentItems.length} documenten</b>.</p>
   
  {/if}
</section>

<style lang="scss">

  section {
    padding: 3em;
    width: 900px;
  }

  .actions {
    display: inline-block;
    transition: opacity 0.2s ease;
    opacity: 1;

    &.fade {
      opacity: 0;
    }
  }

  .total {
    margin-top: 3rem;
    font-size: 0.8rem;
  }

</style>
