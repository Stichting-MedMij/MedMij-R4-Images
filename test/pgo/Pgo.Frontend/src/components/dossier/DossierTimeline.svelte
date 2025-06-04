<script lang='ts'>
    /*  DossierTimeline and DossierTable are two suggestions team came up to show the content
        of reports and images in a dossier. While all PGOs take different approaches, feedback
        from test users at Patiëntenfederatie Nederland showed that a combination of timeline
        view with an option to compact the view to tables and filter on reports or images is
        preferred. This is a quick implementation for demonstration purposes. See Zorgdossier > Tijdlijn.
    */
    import { dossierStore, type DocumentReferenceContentItem } from '../../stores/dossier-store';
    import { base } from '../../stores/baseurl-store';
    import { get } from 'svelte/store';
    import { filterConfig, filteredSortedGroupedContent, groupConfig, sortConfig, dossierTimelineViewStore, type Group, type GroupConfig, type SortConfig, searchConfig } from '../../stores/dossier-timelines-store';
    import { navigate } from "svelte-routing";
    import { PATHS } from '../../config/paths';

    let showAuthorDetailsForItemId: string | undefined = undefined;

    function getTypeCodeLabel(typeCode?: string) {
        switch (typeCode) {
            case 'REPORTS':
                return 'Verslag';
            case 'IMAGES':
                return 'Beeld';
            default:
                return 'Document';
        }
    }

    function getIconClassNames(contentType?: string) {
        switch (contentType) {
            case 'application/pdf':
                return 'fa fa-file-pdf';
            case 'application/dicom':
            case 'application/dicom+json':
                return 'fa-solid fa-file-medical';
            case 'image/png':
            case 'image/jpeg':
                return 'fa-regular fa-file-image';            
            default:
                return 'fa-regular fa-file';
        }
    }

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

    function openGroupInViewer(group: Group)
    {
        const ids = group.documentReferenceContentItems.map(item => item.id).join(',');
        const url = `${get(base)}${PATHS.VIEW}/${ids}`;
        navigate(url, { replace: false });
    }

    // enum FetchMode
    // {
    //     DicomOrginal = 'original',      // A download of the image data from DICOMweb multipart message, file extracted. Usually a DCM.
    //     DicomStream = 'stream',         // A stream of the image data from DICOMweb multipart message with content-disposition to open viewer. Usually a DCM.
    //     DicomRendered = 'rendered',     // A direct http fetch of the image from url, the JPEG rendered version of a DCM instance or frame.
    //     WebDirect = 'web'               // A direct http fetch of the image from url.
    // }

</script>

<div class="filters">
    <b>Zoek</b>
    <input bind:value={$searchConfig.search} type="text" placeholder="op beeld en verslag" />
    <b>Filter</b>
    <select bind:value={$filterConfig.creationYear}>
        <option value="">Alle jaren</option>
        {#each $dossierStore.documentReferenceContentYears as year}
            <option value="{year}">{year}</option>
        {/each}
    </select>
    <select bind:value={$filterConfig.provider}>
        <option value="">Alle zorginstellingen</option>
        {#each $dossierStore.documentReferenceContentProviders as provider}
            <option value="{provider}">{provider}</option>
        {/each}
    </select>
</div>
<div class="timeline">
    {#if $dossierStore.documentReferenceContentItems.length === 0}
        <div>
            <p class="content-name">Er is nog geen beeldinformatie opgehaald bij zorgaanbieders.</p>
        </div>
        {/if}
        {#if $filteredSortedGroupedContent.length === 0}
        <div>
            <p class="content-name">Geen resultaten gevonden voor deze zoekopdracht.</p>
        </div>
        {:else}
        {#each $filteredSortedGroupedContent as group}
            {#if group.documentReferenceContentItems.length > 0}
                <!-- Show header with year only if different from last iteration. -->
                {#if $filteredSortedGroupedContent.indexOf(group) === 0 || group.documentReferenceContentItems[0].creationYear !== $filteredSortedGroupedContent[$filteredSortedGroupedContent.indexOf(group) - 1]?.documentReferenceContentItems[0]?.creationYear}
                    <h3>{group.documentReferenceContentItems[0].creationYear}</h3>
                {/if}
                <div class="group-header">
                    <div class="dotline">
                        <div class="dot"></div>
                        <div class="line"></div>
                        <!-- Show stop only if last in year group. -->                        
                        {#if $filteredSortedGroupedContent.indexOf(group) === $filteredSortedGroupedContent.length - 1 || group.documentReferenceContentItems[0].creationYear !== $filteredSortedGroupedContent[$filteredSortedGroupedContent.indexOf(group) + 1]?.documentReferenceContentItems[0]?.creationYear}
                            <div class="stop"></div>
                        {/if}
                    </div>
                    <div class="group-content">
                        {#each group.documentReferenceContentItems as contentItem}
                            <div class="content-item">
                                {#if $filteredSortedGroupedContent.indexOf(group) === 0 || contentItem.creationDate !== group.documentReferenceContentItems[group.documentReferenceContentItems.indexOf(contentItem) - 1]?.creationDate}
                                    <div class="date">{contentItem.creationDate}</div>
                                {/if}
                                <div class="document">
                                    <div>
                                        <div class="type-label">
                                            <i class="icon {getIconClassNames(contentItem.contentType)}"></i>
                                            <span>{getTypeCodeLabel(contentItem.typeCode)}</span>
                                        </div>
                                    </div>
                                    <div class="properties">
                                        <div class="title">{contentItem.title || getAlternativeTitleForDocument(contentItem.typeCode)}</div>
                                        <div class="authors">
                                            {#if contentItem.author}
                                                <a class="author-summary" href="#toon-details" on:click|preventDefault="{() => {  showAuthorDetailsForItemId = showAuthorDetailsForItemId == contentItem.id ? undefined : contentItem.id; }}">{contentItem.author[0].value}</a>
                                                <div class="author-details" class:show={contentItem.id === showAuthorDetailsForItemId}>
                                                    {#each contentItem.author as author}
                                                        <div class="author">
                                                            {#if author.key.startsWith('Organization/')}
                                                                <div class="author-type">Zorginstelling:</div>
                                                            {:else if author.key.startsWith('PractitionerRole/')}
                                                                <div class="author-type">Zorgverlenersrol:</div>
                                                            {:else if author.key.startsWith('Practitioner/')}
                                                                <div class="author-type">Behandelaar:</div>
                                                            {:else if author.key.startsWith('Patient/')}
                                                                <div class="author-type">Patiënt:</div>
                                                            {:else if author.key.startsWith('Device/')}
                                                                <div class="author-type">Medisch apparaat:</div>
                                                            {:else if author.key.startsWith('RelatedPerson/')}
                                                                <div class="author-type">Betrokken persoon:</div>
                                                            {:else}
                                                                <div class="author-type">Auteur:</div>
                                                            {/if}                                                        
                                                            <div class="author-name">{author.value}</div>
                                                        </div>
                                                    {/each}
                                                </div>
                                            {/if}
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                        {/each}
                        <div class="actions">
                            <button class="iconbutton" on:click="{() => openGroupInViewer(group)}"><i class="fa-solid fa-eye"></i> Bekijken </button>
                       </div>
                    </div>
                </div>
            {/if}
        {/each}
    {/if}
</div>

<style lang="scss">


.filters {

    b {
        font-size: 0.8em;
        font-weight: 700;
        padding: 0.5em 1em;
    }
}

.timeline {
    margin: 30px 15px;

    .group-header {
        display: flex;
        flex-direction: row;
        
        .dotline {
            display: flex;
            flex-direction: column;
            width: 32px;
            margin-right: 15px;
            .dot {
                min-height: 32px;
                width: 32px;
                background-color: #ccc;
                border-radius: 50%;
                display: inline-block;

            }

            .line {
                --widthOfLine:2px;
                --numberOfLines:1;
                
                background: linear-gradient(90deg, #0000 calc(100% - var(--widthOfLine)), #ccc 0);
                background-size: calc((100% - var(--numberOfLines)*var(--widthOfLine))/(var(--numberOfLines) + 1) + var(--widthOfLine)) 100%;
                
                flex-grow: 1;
                width: 32px;
                height: 100%;
                display: block;
                white-space: pre;
            }

            .stop {
                width: 8px;
                height: 4px;
                background-color: #ccc;
                margin: 0 auto;
            }
        }

        &:hover .dotline .dot {
            transition: background-color 0.3s ease;
            background-color: #999;
        }
    }

    .group-content {
        flex-grow: 1;
        // background-color: #ccc;

        .content-item {
            // padding: 15px;
            margin-bottom: 15px;
            // background-color: #fff;

            .date {
                margin: 0.2em 0 1.2em 0;
            }

            .document {
                display: flex;
                flex-direction: row;

                .type-label {
                    background-color: #e0e0e0;
                    border-radius: 4px;
                    width: 9em;

                    .icon {
                        margin: 0.8em;
                    }

                    span {
                        margin: 0.5em;
                    }
                }
                
                .properties {
                    flex: 1;
                    margin-left: 1em;

                    .title {
                        font-weight: 700;
                    }

                    .author-summary {
                        display: inline-block   ;
                        margin-right: 0.5em;
                        color: #333;
                        font-size: 0.8em;
                        text-decoration-style: dashed;

                        &:hover {
                            color: #000;
                            text-decoration-style: underline;
                        }
                    }

                    .author-details {
                        font-size: 0.8em;
                        margin: 0;
                        max-height: 0;
                        overflow: hidden;
                        transition: max-height 0.3s ease;
                        transition: margin 0.3s ease;

                        &.show {
                            margin: 0.5em 0 0.5em 1em;
                            max-height: 500px;
                        }

                        .author {
                            display: flex;
                            flex-direction: row;
                            margin: 0.5em 0;

                            .author-type {
                                font-weight: 700;
                                margin-right: 0.5em;
                            }

                            .author-name {
                                font-weight: 400;
                            }
                        }
                    }

                    
                }
            }
        }

        .actions {
            
            .iconbutton {
                margin: 0.2em 0 1em 0;
                width: 9em;
            }
        }
    }
}

</style>
