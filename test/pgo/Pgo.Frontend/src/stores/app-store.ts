/*  AppStore keeps a boolean for whether the sidebar menu should be shown.
    When document page is shown (see App.svelte and Document.svelte), the
    sidebar menu is hidden to allow more space for showing images and reports. 
*/
import { writable } from 'svelte/store';

export const collapseMenus = writable<boolean>(false);