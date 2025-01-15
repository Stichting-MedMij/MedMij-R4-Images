<script lang='ts'>
    /*  DossierTable and DossierTimeline are two suggestions team came up to show the content
        of reports and images in a dossier. While all PGOs take different approaches, feedback
        from test users at Patiëntenfederatie Nederland showed that a combination of timeline
        view with an option to compact the view to tables and filter on reports or images is
        preferred. This is a quick implementation for demonstration purposes. See Zorgdossier > Verslagen + Beelden.
    */
    import { dossierStore, type DocumentReferenceContentItem } from '../../stores/dossier-store';
    import { base } from '../../stores/baseurl-store';
    import { get } from 'svelte/store';
    import { filterConfig, filteredSortedGroupedContent, groupConfig, sortConfig, dossierTableViewStore, type Group, type GroupConfig, type SortConfig } from '../../stores/dossier-tableviews-store';
    import ContextMenu from "svelte-contextmenu";
    import { navigate } from 'svelte-routing';
    import { PATHS } from '../../config/paths';
    
    let contextMenu: ContextMenu;
    let contentMenuContentItem: DocumentReferenceContentItem;

    export let typeCode: string;

    function getAlternativeTitleForDocument(typeCode?: string) {
        switch (typeCode) {
            case 'REPORTS':
                return 'Verslag zonder titel';
            case 'IMAGES':
                return 'Beeld zonder titel';
            default:
                return 'Document zonder titel';
        }
    }

    function openDocumentInViewer(documentReference: DocumentReferenceContentItem)
    {
        const url = `${get(base)}${PATHS.VIEW}/${documentReference.id}`;
        navigate(url, { replace: false });
    }

    function downloadPdfDocument(documentReference: DocumentReferenceContentItem)
    {
        alert('In dit prototype een download met content-disposition header weggelaten. Zie DocumentController.GetDicomArchiveDownload() voor voorbeeld.');
    }

    function downloadDicomArchive(documentReference: DocumentReferenceContentItem)
    {
        const url = `${get(base)}/api/document/dicom/${documentReference.id}`;
        window.open(url, '_blank');
    }

</script>

<div class="filters">

    <b>Sorteer op</b>
    <select bind:value={$sortConfig.direction}>
        <option value="desc">datum aflopend</option>
        <option value="asc">datum oplopend</option>
    </select>
    <b>Zorginstellingen</b>
    <select bind:value={$filterConfig.provider}>
        <option value="">Alle zorginstellingen</option>
        {#each $dossierStore.documentReferenceContentProviders as provider}
            <option value="{provider}">{provider}</option>
        {/each}
    </select>
</div>
<div class="reports">
    <table>
        <tr>
            <th class="title">Bestandsnaam</th>
            <th class="created">Datum onderzoek</th>
            <th class="provider">Zorginstelling</th>
            <th class="actions"></th>
        </tr>
        {#if $filteredSortedGroupedContent.length === 0}
            <tr class="no-content-item">
                <td colspan="4">Er is nog geen rapportinformatie opgehaald bij zorgaanbieders.</td>
            </tr>
        {:else}           
            {#each $filteredSortedGroupedContent as group}
                {#if group.documentReferenceContentItems.length > 0}
                    {#each group.documentReferenceContentItems as contentItem}
                        {#if contentItem.typeCode === typeCode}
                            <tr class="document">
                                <td class="title">{contentItem.title || getAlternativeTitleForDocument(contentItem.typeCode)}</td>
                                <td class="created">{contentItem.creationDate}</td>
                                <td class="provider">{contentItem.provider}</td>
                                <td class="actions">
                                    <button class="iconbutton" on:click="{() => openDocumentInViewer(contentItem)}"><i class="fa-solid fa-eye"></i> Bekijk </button>
                                    <!-- svelte-ignore a11y-interactive-supports-focus -->
                                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                                    <div class="iconbutton-menu" role="button" on:click={(e) => { contentMenuContentItem = contentItem; contextMenu.show(e); }}>
                                        <i class="fa-solid fa-ellipsis"></i>
                                    </div>
                                </td>
                            </tr>
                        {/if}
                    {/each}
                {/if}
            {/each}
    {/if}
    </table>
</div>

<ContextMenu bind:this={contextMenu}>
    {#if contentMenuContentItem}
        {#if contentMenuContentItem.typeCode === 'REPORTS'}
            <div class="context-menu-info">
                <h3>Downloaden op je apparaat</h3>
                <p>
                    Met de volgende optie kun je een verslag downloaden<br />
                    als PDF-document, bijvoorbeeld om te bewaren.
                </p>
                <p>
                    Let er op dat deze dan op je apparaat terecht komt<br />
                    en daar blijft staan tot je het verwijdert. Omdat je een<br />
                    webbrowser gebruikt, komt het bestand in je downloadmap.<br />
                    De locatie vindt je bij de instellingen van je browser.
                </p>
                <p>
                    Wil je alleen bekijken, dan is het niet nodig te downloaden.
                </p>
            </div>
            <li>
                <button type="button" class="context-menu-item context-menu-default" on:click={() => downloadPdfDocument(contentMenuContentItem)} aria-label="Download bestand">
                    <div class="context-menu-icon fa-solid fa-download"></div>
                    <div class="context-menu-label">
                        <span class="context-menu-text">Download verslag <small>(.pdf)</small></span>
                        <small class="context-menu-size">{contentMenuContentItem?.size || '(grootte onbekend)'}</small>
                    </div>
                </button>
            </li>
        {/if}
        {#if contentMenuContentItem.typeCode === 'IMAGES'}
            <div class="context-menu-info">
                <h3>Downloaden op je apparaat</h3>
                <p>
                    Met de volgende optie kun je een beeld downloaden<br />
                    als DICOM-document, bijvoorbeeld om te bewaren.
                </p>
                <p>
                    Voor DICOM-bestanden heb je een apart programma nodig.<br />
                    Let er op dat deze dan op je apparaat terecht komt<br />
                    en daar blijft staan tot je het verwijderd.
                </p>
                <b>
                    Wil je alleen bekijken, dan is het niet nodig te downloaden.
                </b>
            </div>
            <li>
                <button type="button" class="context-menu-item context-menu-default" on:click={() => downloadDicomArchive(contentMenuContentItem)} aria-label="Download bestand">
                    <div class="context-menu-icon fa-solid fa-download"></div>
                    <div class="context-menu-label">
                        <span class="context-menu-text">Download origineel beeld <small>(.dcm)</small></span>
                        <small class="context-menu-size">{contentMenuContentItem?.size || '(grootte onbekend)'}</small>
                    </div>
                </button>
            </li>
        {/if}
    {/if}
</ContextMenu>

<style lang="scss">

.filters {

    b {
        font-size: 0.8em;
        font-weight: 700;
        padding: 0.5em 1em;
    }
}

.reports {
    margin: 30px 15px;

    table {
        border-collapse: collapse;
        font-size: 0.9em;

        tr.no-content-item td {
            padding: 1em;
        }

        tr {
            background-color: #fff;

            th {
                background-color: #f3f3f3;
                text-align: left;
                padding: 1em;

                &.title {
                    width: auto;
                }

                &.created {                
                    width: 10%;
                    text-align: right;
                    white-space: nowrap;
                }

                &.provider {
                    width: 20%;
                }

                &.actions {
                    width: 10%;
                    text-align: right;
                }
            }

            td {
                border-bottom: 4px solid #f3f3f3;
                padding: 1em;

                &.title {
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                }

                &.created {
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                    text-align: right;
                }

                &.provider {
                    white-space: nowrap;
                    overflow: hidden;
                    text-overflow: ellipsis;
                }

                &.actions {
                    white-space: nowrap;
                    text-align: right;
                }
            }

            &:hover {
                background-color: #ccc;
            }
        }

    }
}

.iconbutton-menu {
    display: inline-block;
    width: 1em;
    height: 1em;
    padding: 0.4em;
    margin-left: 0.5em;
    cursor: pointer;

    &:hover {
        background: #eee;
        border-radius: 50%;
    }
}

</style>
