/*  BaseurlStore is a service that updates base-url in web page
    so the Svelte app can handle different https://host/base-url
    depending on deployment in local development and test cluster.
*/
import { writable } from 'svelte/store';

export const base = writable<string>('');

export function initializeBaseUrl() {
    if (typeof document !== 'undefined') {
        const baseElement = document.querySelector('base');
        if (baseElement) {
            let href = baseElement.getAttribute('href');
            if (href) {
                href = href.slice(0, -1); /* remove last slash */
                base.set(href);
            }
        }
    }
}
