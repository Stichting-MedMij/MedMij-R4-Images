/*  PATHS const helps build up the routes or urls in the application.
    This prototype makes use of a simple Svelte router, PATHS helps.
*/
export const PATHS = {
  INTRODUCTION: '/',
  INFORMATION: '/uitleg',
  LOGIN: '/login',
  IMPORT: '/import',
  DOSSIER: '/dossier', // Routes `{$base}{PATHS.DOSSIER}/:tab`.
  DOSSIER_TIMELINE: 'tijdlijn',
  DOSSIER_REPORTS: 'verslagen',
  DOSSIER_IMAGES: 'beelden', 
  VIEW: '/view', // Routes `${PATHS.VIEW}/${documentReferenceIds}`.
};