/*  DossierTableviewsStore leverages the DossierStore to provide a collection
    of DocumentReferenceContentItems that can be filtered, sorted and grouped.
    DossierStore reads these entries from FHIR DocumentReference resources.
    This store is used by the DossierTable.svelte component in two tabs on 
    dossier.svelte page. Both beeld and verslag tabs show the filtered entries
    in this store.
*/
import { writable, get, derived, type Readable } from 'svelte/store';
import { dossierStore, type DossierStoreState, type DocumentReferenceContentItem } from './dossier-store';

export const dossierTableViewStore = writable<DossierStoreState>({
    documentReferenceContentItems: [],
    documentReferenceContentYears: [],
    documentReferenceContentProviders: [],
});

export const searchConfig = writable({
  search: ''
});

export const filterConfig = writable<DocumentReferenceContentItem>({
  description: '',
  author: [],
  typeCode: '',
  provider: '',
  title: '',
  creationYear: '',
} as DocumentReferenceContentItem);

export interface SortConfig {
  field: string;
  direction: string;
}

export const sortConfig = writable<SortConfig>({
  field: 'creationTimestamp',
  direction: 'desc',
});

export interface GroupConfig {
  field: string;
}
export const groupConfig = writable<GroupConfig>({
  field: 'groupName'
});

export interface Group {
  key: string;
  documentReferenceContentItems: DocumentReferenceContentItem[];
}

export const filteredSortedGroupedContent: Readable<Group[]> = derived(
  [dossierStore, searchConfig, filterConfig, sortConfig, groupConfig],
  ([$contentStore, $searchConfig, $filterConfig, $sortConfig, $groupConfig]) => {

    // Filter
    let filtered = $contentStore.documentReferenceContentItems.filter((item) => {
      if ($searchConfig.search) {
        const searchText = `${item.description} ${JSON.stringify(item.author)} ${item.provider} ${item.title} ${item.creationTimestamp}`;
        if (!searchText.toLowerCase().includes($searchConfig.search.toLowerCase())) return false;
      }
      if ($filterConfig.description && !item.description?.indexOf($filterConfig.description)) return false;
      if ($filterConfig.author?.length && item.author !== $filterConfig.author) return false;
      if ($filterConfig.typeCode && item.typeCode !== $filterConfig.typeCode) return false
      if ($filterConfig.provider && item.provider !== $filterConfig.provider) return false;
      if ($filterConfig.title && !item.description?.indexOf($filterConfig.title)) return false;
      if ($filterConfig.creationYear && item.creationYear !== $filterConfig.creationYear) return false;
      return true;
    });

    // Sort
    filtered.sort((item1: any, item2: any) => {
      const { field, direction } = $sortConfig;
      const directionPosition = direction === 'asc' ? 1 : -1;  
      if (item1[field] < item2[field]) return -1 * directionPosition;
      if (item1[field] > item2[field]) return 1 * directionPosition;
      return 0;
    });

    // Group
    if ($groupConfig.field) {
      const grouped = filtered.reduce((acc: { [key: string]: any[] }, item: any) => {
        const groupKey = item[$groupConfig.field];
        if (groupKey === undefined) {
          // Ungrouped entries each in it's own group.
          acc[item.id] = [item];
        } else {
          // Grouped entries in a matching (new) group.
          if (!acc[groupKey]) acc[groupKey] = [];
          acc[groupKey].push(item);
        }
        return acc;
      }, {});

      // Grouped entries with reports (verslagen) first.
      var entries = Object.entries(grouped).map(([key, documentReferenceContentItems]) => ({
        key,
        documentReferenceContentItems: documentReferenceContentItems.sort(sortReportsFirst),
      } as Group));        
      return entries;
    }

    // Ungrouped entries each in it's own group.
    var ungrouped = Object.entries(filtered).map(([key, documentReferenceContentItem]) => ({
      key,
      documentReferenceContentItems: [ documentReferenceContentItem ],
    } as Group));

    return ungrouped;
  }
);

function sortReportsFirst(a: DocumentReferenceContentItem, b: DocumentReferenceContentItem) {
  if (a.typeCode === 'REPORTS') return -1;
  if (b.typeCode === 'REPORTS') return 1;
  return a.typeCode?.localeCompare(b.typeCode || '') || 0;
}
