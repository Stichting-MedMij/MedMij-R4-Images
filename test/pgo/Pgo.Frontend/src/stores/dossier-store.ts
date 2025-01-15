/*  DossierStore is a service that read FHIR DocumentReference resources
    and populates a view model. Two additional stores DossierTableviewsStore
    and DossierTimelineStore use this store, sort and filter for pages.
*/
import { writable, get, derived } from 'svelte/store';
import { base } from './baseurl-store';
import { defaultFetchOptions, ensureSuccess, sortDescending } from '../config/helpers';


/* View models */

export interface DossierStoreState {
    documentReferenceContentItems: DocumentReferenceContentItem[];
    documentReferenceContentYears: string[];
    documentReferenceContentProviders: string[];
}

// https://profiles.ihe.net/ITI/MHD/StructureDefinition-IHE.MHD.Minimal.DocumentReference.html
export interface DocumentReferenceContentItem {
    // DocumentReference
    id?: string;
    description?: string;
    author?: { key: string, value: string }[];
    groupName?: string;
    typeCode?: string;
    provider?: string;

    // DocumentRefrence.content[1..1].attachment
    contentType?: string;
    language?: string;
    url?: string;
    size?: string;
    hash?: string;
    title?: string;
    creationTimestamp?: string;
    creationYear?: string;
    creationDate?: string;
    creationTime?: string;

    // DocumentRefrence.format[0..1].display
    formatDisplay?: string;
}

export const dossierStore = writable<DossierStoreState>({
    documentReferenceContentItems: [],
    documentReferenceContentYears: [],
    documentReferenceContentProviders: [],
});


/* API functions */

export async function fetchDocumentReferences() {
    try {
        const response = await fetch(`${get(base)}/api/dossier/documentreferences`, defaultFetchOptions);
        ensureSuccess(response);

        const data: DossierStoreState = await response.json();
        data.documentReferenceContentYears = [...new Set(data.documentReferenceContentItems.map(item => item.creationYear).filter((year): year is string => !!year))].sort(sortDescending);
        data.documentReferenceContentProviders = [...new Set(data.documentReferenceContentItems.map(item => item.provider).filter((provider): provider is string => !!provider))].sort();
        dossierStore.set(data);

    } catch (error) {
        console.error('Error fetching bundle of document references. ', error);
    }
}

export async function importDocumentReferences(): Promise<void> {
    try {
        const response = await fetch(`${get(base)}/api/dossier/import`, defaultFetchOptions);
        ensureSuccess(response);
        await fetchDocumentReferences();

    } catch (error) {
        console.error('Error simulating import of document references. ', error);
    }
}

export async function resetDocumentReferences(): Promise<void> {
    try {
        const response: Response = await fetch(`${get(base)}/api/dossier/reset`, defaultFetchOptions);
        ensureSuccess(response);
        await fetchDocumentReferences();
        
    } catch (error) {
        console.error('Error reset of dataset in simulated dossier.', error);
    }
}