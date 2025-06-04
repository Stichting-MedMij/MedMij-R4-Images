<script lang="ts">
    /*  View page (DocumentViewer) is an example for viewing beeld en verslag (PDF reports and DICOM images).
        Here we show a PDF viewer and a DICOMweb image viewer, with some navigation and options for zooming
        and printing likely to be available in a real-world scenario. While the PGO's implementation would be
        more complex and may use a seperate viewer web application, here's an  example of how WADO-RS
        rendered images instances can be viewed in a web application. Both images and reports are NOT stored
        by the bowser in cache, just loaded in DOM with a string of base64 encoded bytes. That could be more
        more efficient and setup more elegent, but serves as an example to the no-cache requirement. 

        The page is opened on url with a list of comma-seperated DocumentReference.id, e.g. /view/id,id,id.
        Additionally a selection can be passed to open a specific document, e.g. /view/id,id,id/selectedId.

        Each DocumentReference contains a reference to a document, which can be a PDF report or a DICOM KOS.
        The PDF report is a single page or multi-page document, and is displayed in a PDF viewer (canvas).

        The DICOM Key Object Selection (KOS) usually refers to a study created during one patient visit
        that references one or multiple series of DICOM instances. PGO does a lookup for the study and
        parses available image instances. The image data in this example is rendered by DICOMweb WADO-RS
        as a base64 encoded JPEG image (to prevent caching in browser cache), and displayed in browser.
        
        Some DICOM instances may have multiple frames, for example in CT and MRI scans. Retrieving and use
        is similar to instances in a study. An idea is to have the viewer navigate frames with a slider control.
        In-browser viewing is preferred. For advanced use, the user can download the DICOM Part10 archive file. 
    */
    import { onMount, onDestroy } from "svelte";
    import { createEventDispatcher } from "svelte";
    import { base } from "../stores/baseurl-store";
    import { get } from 'svelte/store';
    import { PdfViewer, type PdfPageContent, type PdfLoadSuccess, type PdfException } from "svelte-pdf-simple";
    import { defaultFetchOptions, ensureSuccess } from "../config/helpers";

    interface DocumentSearchResponse {
        pdf: PdfDocument[];        
        kos: KosDocument[];
    }

    // PDF report selection (Verslag).
    interface PdfDocument {
        documentReferenceId: string;
        url: string;
    }

    // Key object selection document with unique identifiers to available images in a study (Beeld).
    interface KosDocument {
        documentReferenceId: string;
        studyUid: string;
        series: DicomSeries[];
    }

    interface DicomSeries {
        seriesUid: string;
        instances: DicomInstance[];
    }

    interface DicomInstance {
        instanceUid: string;
        instanceType: string;
        frames: number[];
    }
    
    export let documentReferenceIds: string;
    export let selectedReferenceId: string | undefined;

    let overview: DocumentSearchResponse = { pdf: [], kos: [] };
    let selected: PdfDocument | DicomInstance | undefined;
    let selectedPdf: PdfDocument | undefined;
    let selectedKos: KosDocument | undefined;
    let selectedSeries: DicomSeries | undefined;
    let selectedInstance: DicomInstance | undefined;
    let selectedFrame: number = 0;

    let pdfViewer: PdfViewer;
    let pdfViewerPageNumber = 0;
    let pdfViewerTotalPages = 0;
    let pdfViewerIsLoaded = false;
    let pdfViewerScale = 1.0;

    let dicomViewerFullWidth = false;
    let dicomViewerFrame = 0;
    let dicomViewerTotalFrames = 0;
    
    const dispatchEvent = createEventDispatcher();

    onMount(async () => {
        dispatchEvent("open");
        window.addEventListener("keydown", closeOnEscapeKey);
        overview = await fetchDocumentsOverview();
        selectAndSetFocusOnFirstDocument();        
    });

    onDestroy(() => window.removeEventListener("keydown", closeOnEscapeKey));

    
    
    function selectAndSetFocusOnFirstDocument(): void {
        selectedPdf = overview.pdf.find(pdf => pdf.documentReferenceId === selectedReferenceId);
        selectedKos = overview.kos.find(kos => kos.documentReferenceId === selectedReferenceId);
        selectedSeries = selectedKos && selectedKos.series[0];
        selectedInstance = selectedSeries && selectedSeries.instances[0];
        selected = selectedPdf || selectedInstance;
    }


    function selectDocument(pdf?: PdfDocument, kos?: KosDocument, series?: DicomSeries, instance?: DicomInstance, frame: number = 0): void {
        selectedPdf = pdf;
        selectedKos = kos;
        selectedSeries = series;
        selectedInstance = instance;
        selectedFrame = frame;
        selected = selectedPdf || selectedInstance;
    }


    // Loads a list of documents for the given document reference ids in url.
    // That's a group of PDF reports and images in a DICOM KOS study that we want to view.
    async function fetchDocumentsOverview(): Promise<DocumentSearchResponse> {
        try {
            const body = { "documentReferenceIds": documentReferenceIds.split(',') };
            const response = await fetch(`${get(base)}/api/document/search`, {
                ...defaultFetchOptions,
                method: 'POST',
                body: JSON.stringify(body)
            });
            ensureSuccess(response);
            return await response.json();

        } catch (error) {
            console.error('Error fetching timeline:', error);
            return {} as DocumentSearchResponse;
        }
    }


    // Loads a PDF document as a base64 encoded string, which helps prevent browser from storing files on disk.
    async function fetchPdfDocument(pdf: PdfDocument): Promise<string> {
        const response = await fetch(`${get(base)}/api/document/pdf/${pdf.documentReferenceId}`, defaultFetchOptions);
        return await response.text();
    }

    // Loads a rendered image of DICOM instance or frame as a base64 encoded string, which helps prevent browser from storing files on disk.
    async function fetchDicomImage(kos: KosDocument, series?: DicomSeries, instance?: DicomInstance, frame: number = 0): Promise<string> {
        const response = await fetch(`${get(base)}/api/document/jpeg/${kos.documentReferenceId}/${kos.studyUid}/${series?.seriesUid}/${instance?.instanceUid}/${frame > 0 ? frame : ''}`, defaultFetchOptions);
        return await response.text();
    }

    
    /* PDF viewer component navigation and loading handlers. */
    
    function pdfViewerNavigatePages(forward: boolean = false): void {
        forward 
            ? (pdfViewerPageNumber === pdfViewerTotalPages ? pdfViewerPageNumber = 1 : pdfViewerPageNumber++)
            : (pdfViewerPageNumber === 1 ? pdfViewerPageNumber = pdfViewerTotalPages : pdfViewerPageNumber--);
        pdfViewer.goToPage(pdfViewerPageNumber);
    }

    function pdfViewerPageChanged(event: CustomEvent<PdfPageContent>): void {
        pdfViewerPageNumber = event.detail.pageNumber;
    }

    function pdfViewerLoadedSuccess(event: CustomEvent<PdfLoadSuccess>) {
        pdfViewerTotalPages = event.detail.totalPages;
        pdfViewerPageNumber = 1;
        pdfViewerIsLoaded = true;
    }

    function pdfViewerLoadFailure(event: CustomEvent<PdfException>) {
        window.alert(event.detail.message);
    }

    
    /* Closing document viewer, printing contents, etc. */

    function close() {
        dispatchEvent("close");
        window.history.back();
    }

    function closeOnEscapeKey(event: KeyboardEvent) {
        if (event.key === "Escape") close();
    }

    function print(elementId: string) {
        var element = window.document.getElementById(elementId);
        var openWindow = window.open("", "title", "attributes");
        if (element && openWindow) {
            openWindow.document.write(element.innerHTML);
            openWindow.document.close();
            openWindow.focus();
            openWindow.print();
        }
        openWindow?.close();
    }

</script>

<div class="page">

    <div class="page-toolbar">
        <ul class="page-toolbar-one">
            <li></li>
        </ul>
        <ul class="page-toolbar-two">
            <!-- svelte-ignore a11y-click-events-have-key-events -->
            <!-- svelte-ignore a11y-no-static-element-interactions -->
            <li><span class="iconbutton2" title="Je kunt het scherm ook sluiten met de Escape-toets." on:click={() => close()}><i class="fa-solid fa-xmark"></i></span></li>
        </ul>
    </div>
    
    
    <main class="documents">
        <section class="thumbnails">
            <div class="thumbnails-toolbar">
                <ul class="thumbnails-toolbar-one">
                    <li>
                        <select bind:value={selected}>
                            {#each overview.pdf as pdf, i}
                                <option value={pdf}>verslag {i + 1}</option>
                            {/each}
                            {#each overview.kos as kos, k}
                                {#each kos.series as series, s}
                                    {#each series.instances as instance, i}
                                        <option value={instance}>beeld {k+1}-{s+1}-{i+1}</option>
                                    {/each}
                                {/each}
                            {/each}
                        </select>
                    </li>
                </ul>
            </div>
            <div class="thumbnails-overview">
                {#each overview.pdf as pdf, i}
                    <div class="thumbnail-report">
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <div class="thumbnail" on:click={() => selectDocument(pdf)} class:selected={selected === pdf}>
                            <i class="fa-regular fa-file-pdf"></i>
                            {#if overview.pdf.length > 1}
                                <small>Verslag {i+1}</small>
                            {/if}
                        </div>
                    </div>
                {/each}
                {#each overview.kos as kos}
                    {#each kos.series as series}
                        {#each series.instances as instance, i}
                            <div class="thumbnail-image">
                                {#await fetchDicomImage(kos, series, instance) then fetchedImageBytes}
                                    <!-- svelte-ignore a11y-click-events-have-key-events -->
                                    <!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
                                    <img class="thumbnail" src={`data:image/jpeg;base64,${fetchedImageBytes}`} on:click={() => selectDocument(undefined, kos, series, instance)} alt="dicom" class:selected={selected === instance} />
                                {/await}
                            </div>
                        {/each}
                    {/each}
                {/each}
            </div>
        </section>
        {#if selected === selectedPdf}
            <section class="reports">
                <div class="reports-toolbar">
                    {#if overview.pdf.length > 1}
                        <ul class="reports-toolbar-one">
                            <li>
                                <!-- <label>Verslag</label>
                                <select bind:value={selectedReport}>
                                    {#each overview.directReports as report, i}
                                        <option value={report}>document {i + 1}</option>
                                    {/each}
                                </select> -->
                            </li>
                        </ul>
                    {/if}
                    <ul class="reports-toolbar-two">
                        {#if pdfViewerTotalPages > 0}
                            <!-- svelte-ignore a11y-click-events-have-key-events -->
                            <!-- svelte-ignore a11y-no-static-element-interactions -->
                            <li><span class="iconbutton2" title="Vorige pagina (↑)" on:click={() => pdfViewerNavigatePages(false)}><i class="fa-solid fa-arrow-up"></i></span></li>
                            <li>Pagina {pdfViewerPageNumber} van {pdfViewerTotalPages}</li>
                            <!-- svelte-ignore a11y-click-events-have-key-events -->
                            <!-- svelte-ignore a11y-no-static-element-interactions -->
                            <li><span class="iconbutton2" title="Volgende pagina (↓)" on:click={() => pdfViewerNavigatePages(true)}><i class="fa-solid fa-arrow-down"></i></span></li>
                        {:else}
                            <li>verslag met 1 pagina</li>
                        {/if}
                    </ul>                    
                    <ul class="reports-toolbar-three">
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Zoom in (+)" on:click={() => { pdfViewer.resize(pdfViewerScale = pdfViewerScale+0.2); }}><i class="fa-solid fa-plus"></i></span></li>
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Zoomuit (−)" on:click={() => { pdfViewer.resize(pdfViewerScale = pdfViewerScale-0.2); }}><i class="fa-solid fa-minus"></i></span></li>
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <li><span class="iconbutton2" title="Afdrukken (CTRL + P)" on:click={() => window.print()}><i class="fa-solid fa-print"></i></span></li>
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Downloaden" on:click={() => window.alert("downloaden")}><i class="fa-solid fa-download"></i></span></li>
                    </ul>
                </div>
                <div class="reports-viewer">
                    <div class="reports-viewer-chrome">
                        {#if selectedPdf}
                            {#await fetchPdfDocument(selectedPdf) then fetchedPdfBytes}
                                <PdfViewer
                                    bind:this={pdfViewer}
                                    props={{ data: atob(fetchedPdfBytes), scale: pdfViewerScale }}
                                    on:load_success={pdfViewerLoadedSuccess}
                                    on:load_failure={pdfViewerLoadFailure}
                                    on:page_changed={pdfViewerPageChanged}
                                    />
                            {/await}
                        {/if}
                    </div>
                </div>
                
    
            </section>
        {/if}
        {#if selected === selectedKos}
            <section class="images">
                <div class="images-toolbar">
                    <ul class="images-toolbar-one">
                        {#if dicomViewerTotalFrames > 0}
                            <li>Frame {dicomViewerFrame} van {dicomViewerTotalFrames}</li>
                            <li class="images-frames-slider"><input type="range" min="0" max="{dicomViewerTotalFrames}" bind:value={dicomViewerFrame}></li>
                        {/if}
                        
                    </ul>
                    <ul class="images-toolbar-two">
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Zoom in (+)" on:click={() => { dicomViewerFullWidth = !dicomViewerFullWidth }}><i class="fa-solid fa-magnifying-glass"></i></span></li>
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Afdrukken (CTRL + P)" on:click={() => print('selected-image')}><i class="fa-solid fa-print"></i></span></li>
                        <!-- svelte-ignore a11y-click-events-have-key-events -->
                        <!-- svelte-ignore a11y-no-static-element-interactions -->
                        <li><span class="iconbutton2" title="Downloaden" on:click={() => window.alert("downloaden")}><i class="fa-solid fa-download"></i></span></li>
                    </ul>
                </div>
                <div class="images-viewer">
                    <div class="images-viewer-chrome" class:full-screen={dicomViewerFullWidth}>
                        {#if selectedKos && selectedInstance}
                            {#await fetchDicomImage(selectedKos, selectedSeries, selectedInstance, selectedFrame) then fetchedImageBytes}
                                <!-- svelte-ignore a11y-click-events-have-key-events -->
                                <!-- svelte-ignore a11y-no-noninteractive-element-interactions -->
                                <img id="selected-image" src={`data:image/jpeg;base64,${fetchedImageBytes}`} alt="dicom" on:click={() => { dicomViewerFullWidth = !dicomViewerFullWidth }} />
                            {/await}
                        {/if}
                    </div>
                </div>
            </section>
        {/if}
    </main>

</div>


<style lang="scss">

    .page {        
        .page-toolbar {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            background-color: #999;
            

            .iconbutton2 {
                display: inline-block;
                width: 1.5em;
                background: #a5a5a5;
                color: #2e2e2e;
                cursor: pointer;
                border-radius: 50%;
            }

            &:hover .iconbutton2 {
                background: #aaa;

                &:hover {
                    background: #ccc;
                    color: #000;
                    
                }
            }

            ul.page-toolbar-one {
                padding-inline-start: 0;
                line-height: 3em;
                list-style-type: none;
                margin: 0;

                li {
                    display: inline;
                    padding-left: 2em;
                    line-height: 1.5em;
                    text-align: center;
                    vertical-align: middle;
                }
            }

            ul.page-toolbar-two {
                padding-inline-start: 0;
                line-height: 3em;
                list-style-type: none;
                margin: 0;

                li {
                    display: inline;
                    padding-right: 2em;
                    line-height: 1.5em;
                    text-align: center;
                    vertical-align: middle;
                }                
            }
        }
        
        main.documents {
            flex: 1;
            display: flex;
            flex-direction: row;

            section.thumbnails {
                display: flex;
                flex-direction: column;                
                width: 300px;
                max-width: 300px;

                .thumbnails-toolbar {
                    display: flex;
                    line-height: 3em;
                    flex-direction: row-reverse;
                    justify-content: space-between;
                    background: #ccc;
                    border-bottom: #a5a5a5 1px solid;
                    padding: 0 2em;

                    .iconbutton2 {
                        display: inline-block;
                        width: 1.5em;
                        color: #2e2e2e;
                        cursor: pointer;
                        border-radius: 50%;
                    }

                   
                    ul.thumbnails-toolbar-one {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            padding-left: 0.5em;
                            line-height: 1.5em;
                            text-align: center;
                            vertical-align: middle;
                        }

                        &:hover .iconbutton2 {
                            background: #c0c0c0;

                            &:hover {
                                background: #a5a5a5;
                                color: #000;
                                
                            }
                        }

                        select {
                            padding: 0.5em;
                            font-size: 1em;
                        }
                    }
                }

                .thumbnails-overview {
                    margin: 1em 0;
                    display: flex;
                    flex-direction: column;
                    align-items: center;

                    .thumbnail-report, .thumbnail-image {
                        margin: 1em 0;
                        border: #999 1px solid;
                        box-shadow: 0 0 8px #ccc;

                        div.thumbnail {
                            width: 240px;
                            height: 180px;
                            display: flex;
                            flex-direction: column;
                            justify-content: center;
                            align-items: center;
                            background-color: white;

                            i {
                                font-size: 3em;
                                color: #2e2e2e;

                            }

                            small {
                                margin-top: 1em;
                            }

                            &:hover {
                                background: #f3f3f3;
                                cursor: pointer;
                            }
                        }

                        img.thumbnail {
                            width: 240px;
                            height: auto;
                            max-height: 180px;
                            object-fit: cover;
                            background-color: black;

                            &:hover {
                                opacity: 0.8;
                                cursor: pointer;
                            }
                        }

                        .thumbnail.selected {
                            border: red 1px solid;
                        }
                    }
                }                
            }

            section.reports {
                flex: 1;

                .reports-toolbar {
                    display: flex;
                    line-height: 3em;
                    flex-direction: row;
                    justify-content: space-between;
                    background: #ccc;
                    border-bottom: #a5a5a5 1px solid;
                    padding: 0 2em;

                    .iconbutton2 {
                        display: inline-block;
                        width: 1.5em;
                        color: #2e2e2e;
                        cursor: pointer;
                        border-radius: 50%;
                    }

                    ul.reports-toolbar-one {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            padding-right: 0.5em;
                        }
                    }

                    ul.reports-toolbar-two {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            padding-left: 0.5em;
                            line-height: 1.5em;
                            text-align: center;
                            vertical-align: middle;
                        }

                        &:hover .iconbutton2 {
                            background: #c0c0c0;

                            &:hover {
                                background: #a5a5a5;
                                color: #000;
                                
                            }
                        }
                    }

                    ul.reports-toolbar-three {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            padding-left: 0.5em;
                            line-height: 1.5em;
                            text-align: center;
                            vertical-align: middle;
                        }

                        &:hover .iconbutton2 {
                            background: #c0c0c0;

                            &:hover {
                                background: #a5a5a5;
                                color: #000;
                                
                            }
                        }
                    }
                }

                .reports-viewer {
                    width: 100%;
                    height: 100vh;
                    border: none;
                    background-color: #f3f3f3;

                    .reports-viewer-chrome {
                        margin: 0 2em;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                    }
                }
            }

            section.images {
                flex: 1;

                .images-toolbar {
                    display: flex;
                    line-height: 3em;
                    flex-direction: row;
                    justify-content: space-between;
                    background: #ccc;
                    border-bottom: #a5a5a5 1px solid;
                    padding: 0 2em;

                    .iconbutton2 {
                        display: inline-block;
                        width: 1.5em;
                        color: #2e2e2e;
                        cursor: pointer;
                        border-radius: 50%;
                    }
                   
                    ul.images-toolbar-one {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            line-height: 1.5em;
                            text-align: center;
                            vertical-align: middle;
                        }

                        &:hover .iconbutton2 {
                            background: #c0c0c0;

                            &:hover {
                                background: #a5a5a5;
                                color: #000;
                                
                            }
                        }

                        li.images-frames-slider {
                            
                            input {
                                margin: 0;
                                padding: 0;

                                width: 200px;
                                opacity: 0.7;
                                -webkit-transition: .2s;
                                transition: opacity .2s;

                                &:hover {
                                    opacity: 1;
                                }
                            }
                        }
                    }

                    ul.images-toolbar-two {
                        padding-inline-start: 0;
                        line-height: 3em;
                        list-style-type: none;
                        margin: 0;

                        li {
                            display: inline;
                            padding-left: 0.5em;
                            line-height: 1.5em;
                            text-align: center;
                            vertical-align: middle;
                        }

                        &:hover .iconbutton2 {
                            background: #c0c0c0;

                            &:hover {
                                background: #a5a5a5;
                                color: #000;
                                
                            }
                        }
                    }
                }

                .images-viewer {
                    display: flex;
                    justify-content: center;
                    align-items: center;

                    .images-viewer-chrome {
                        margin-top: 2em;
                        max-width: 800px;
                        width: 96%;

                        img {
                            width: 100%;
                            height: auto;
                            box-shadow: 0 0 8px #ccc;
                            cursor: zoom-in;

                            
                        }

                        &.full-screen {
                            max-width: 100%;
                            z-index: 99;
                            top: 0;
                            cursor: zoom-out;
                        }
                    }
                }
            }
        }
    }
    
</style>
