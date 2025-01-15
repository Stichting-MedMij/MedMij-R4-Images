<script lang="ts">

  /* App.svelte and main.ts is the JavaScript startup for Svelte app, bootstrapped by index.html. */
  import { onMount } from 'svelte';
  import Sidebar from './components/app/Sidebar.svelte';
  import { initializeBaseUrl } from './stores/baseurl-store';
  import { fetchIsUserLoggedIn } from './stores/auth-store';
  import { fetchDocumentReferences } from './stores/dossier-store';
  import { Router, Route } from 'svelte-routing';
  import Introduction from './pages/introduction.svelte';
  import Login from './pages/login.svelte';
  import Import from './pages/import.svelte';
  import Dossier from './pages/dossier.svelte';
  import DocumentViewer from './pages/view.svelte';
  import { PATHS } from './config/paths';
  import { base } from './stores/baseurl-store';
  import { collapseMenus } from './stores/app-store';
  import Information from './pages/information.svelte';

  initializeBaseUrl();
  onMount(async () => await fetchIsUserLoggedIn() && fetchDocumentReferences());

</script>

<div class="grid-container" class:collapsed={$collapseMenus}>
  <Sidebar/>
  <div class="grid-content">
    <Router>
      <!--
        Unfortunately, router is not able to handle optional url fragments, 
        e.g. /web/document/{ids}/{selected?}. Removed double routes in draft
        prototype for clearity. This will do as a quick example.
        
        See: https://github.com/EmilTholin/svelte-routing/issues/39
      -->
      <Route component={Introduction} path="{$base}{PATHS.INTRODUCTION}" />
      <Route component={Information} path="{$base}{PATHS.INFORMATION}" />
      <Route component={Login} path="{$base}{PATHS.LOGIN}" />
      <Route component={Import} path="{$base}{PATHS.IMPORT}" />

      <Route path="{$base}{PATHS.DOSSIER}">
        <Dossier activeTab="{PATHS.DOSSIER_TIMELINE}" />
      </Route>
      <Route path="{$base}{PATHS.DOSSIER}/:tab" let:params>
        <Dossier activeTab="{params.tab}" />
      </Route>
      
      <Route path="{$base}{PATHS.VIEW}/:ids" let:params>
        <DocumentViewer documentReferenceIds="{params.ids}" selectedReferenceId="{undefined}"
          on:open={() => collapseMenus.set(true)}
          on:close={() => { collapseMenus.set(false)}} />
      </Route>
    </Router>
  </div>
</div>

<style lang="scss">

  
  .grid-container {
    display: grid;
    grid-template: "sidebar content";
    grid-template-columns: 220px 1fr;
    background-color: #F3F3F3;
    font-family: 'Montserrat', sans-serif;
    font-weight: 400;
    font-size: 1em;
    line-height: 1.5;

    &.collapsed {
      display: block;
      grid-template-columns: 0 1fr;
    }
  }

  .grid-content {
    width: 100%;
  }

</style>