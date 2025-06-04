<script lang="ts">
  /*  Sidebar is a component simulating a collapsible sidebar menu for all pages.
      For convenience during use-case testing, it shows the name of the logged-in user
      which during testing reveils the scenario of test data used. When not logged in, 
      can open login page and pages for information only. This mimics a PGO somewhat.
  */
  import { Router, links, link, Link } from 'svelte-routing';
  import { PATHS } from '../../config/paths';
  import { authStore, login } from '../../stores/auth-store';
  import '@fortawesome/fontawesome-free/css/all.min.css';
  import { dossierStore } from '../../stores/dossier-store';
  import { collapseMenus } from '../../stores/app-store';
  import { base } from '../../stores/baseurl-store';
</script>


  <div class="sidebar" class:collapsed={$collapseMenus}>
    <aside use:links>
      <i class="fa-sharp fa-solid fa-bars fa-lg menu"></i>
      <Router>
        <nav>
          <ul>
            <li><Link to="{$base}{PATHS.INTRODUCTION}" let:active>Introductie</Link></li>

            <li class="spacer"></li>
            
            {#if !$authStore.loggedIn}
              <li><Link to="{$base}{PATHS.LOGIN}" let:active>Inloggen</Link></li>
              <li><span>Uitwisselen</span></li>
              <li class="spacer"></li>
              <li><Link to="{$base}{PATHS.INFORMATION}" let:active>Uitleg</Link></li>
              <li><span>Zorgdossier</span></li>
            {:else}
              <li><Link to="{$base}{PATHS.LOGIN}" class="link" let:active>Inloggen</Link> <small class="fa fa-check"></small></li>
              <li><Link to="{$base}{PATHS.IMPORT}" class="link" let:active>Uitwisselen</Link> <small>{$dossierStore.documentReferenceContentItems.length}</small></li>
              <li class="spacer"></li>
              <li><Link to="{$base}{PATHS.INFORMATION}" let:active>Uitleg</Link></li>
              <li><Link to="{$base}{PATHS.DOSSIER}" class="link" let:active>Zorgdossier</Link></li>
            {/if}
          </ul>
        </nav>
      </Router>
      
      <small class="username">{$authStore.username}</small>
    </aside>
  </div>

<style lang="scss">

  .collapsed {
    display: none;
  }

  .sidebar {
    grid-area: sidebar;
    min-height: 100vh;
    background: #999;
  }

   aside {
    display: grid;
    grid-template-rows: auto 1fr auto; /* Menu items at the top, space in the middle, logo at the bottom. */
    color: #666;
    margin: 2em 1.25em;
    height: 100%;
    min-height: 100vh;
  }

  .sidebar nav {
    padding-top: 2.8rem;

    ul {
      list-style-type: none;
      padding: 0;

      li {
          margin-top: 2em; /* 10px */ 
      }

      li > span {
          color: #333;
      }
      
      li > :global(a) {
          text-decoration: none;
          color: #333;
          transition: color 0.3s ease;
      }

      li > :global(a:hover) {
          color: #000;
      }

      li > :global(a[aria-current='page']) {
        font-weight: bold;
      }
      li.spacer {
        margin-top: 3em;
        content: " ";
      }
    }
  }

  small.username {
    align-self: end;
    justify-self: last baseline;
    padding-bottom: 3rem;
    color: #666;
    font-size: 0.75em;
    text-align: center;
  }

</style>
