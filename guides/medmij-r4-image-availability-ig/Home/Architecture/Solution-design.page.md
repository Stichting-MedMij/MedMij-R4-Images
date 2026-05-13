# Solution design

## Scope and context
This solution design describes the architecture and interaction patterns for making medical documents and imaging studies available to a Personal Health Record (PHR) within the MedMij Image Availability context.

The architecture covers the interaction between a PHR, a XIS, and an XDS/XCA Gateway that provides access to an underlying XDS environment. The design is based on established IHE profiles and aligns with MedMij principles for interoperability and controlled access.

Moreover, it focuses on the architectural flow and responsibilities. Detailed descriptions of individual transactions and message content are defined in the {{pagelink: TD, text: technical design}}.

## Architectural overview
The architecture follows a layered and mediated approach in which the PHR communicates exclusively with the XIS. The XIS mediates access to the XDS domain through an XDS/XCA Gateway. This separation ensures that the PHR is not exposed to XDS-specific complexity and that protocol handling and access control are handled centrally.

Figure 1 provides an overview of the participating systems, their responsibilities, and the interactions required to support document and image availability. In particular, it illustrates the use of [MHD](https://wiki.ihe.net/index.php/Mobile_access_to_Health_Documents_(MHD)) and [WIA](https://wiki.ihe.net/index.php/Web-based_Image_Access) transactions for querying document metadata, and retrieving documents and images.

{{render: guides/medmij-r4-image-availability-ig/images/Solution architecture overview.png}}

**Figure 1: Solution architecture overview**

## Interaction Model
As shown in Figure 1, the interaction model consists of three main interaction steps. All interactions are initiated by the PHR and routed via the XIS to the XDS/XCA Gateway.

Step 1 – Query timeline
The PHR queries the document timeline via the XIS using the [MHD ITI-67](https://profiles.ihe.net/ITI/MHD/ITI-67.html) transaction, to obtain an overview of available reports and imaging studies. The XIS forwards the request of the PHR to the XDS/XCA Gateway, which retrieves the required data from the XDS environment and returns the response via the XIS to the PHR.

Step 2 – Retrieve document
Based on the timeline data, the PHR retrieves a certain document, such as a radiology report or an imaging manifest, using the [MHD ITI-68](https://profiles.ihe.net/ITI/MHD/ITI-68.html) transaction. The XIS forwards the request of the PHR to the XDS/XCA Gateway, which retrieves the required data from the XDS environment and returns the response via the XIS to the PHR.

Step 3 – Retrieve image
For imaging studies, the PHR retrieves image data using [WADO-RS](https://www.dicomstandard.org/using/dicomweb/retrieve-wado-rs-and-wado-uri) (more specific, the [RAD-107](https://www.ihe.net/uploadedFiles/Documents/Radiology/IHE_RAD_TF_Vol2.pdf) transaction). Image retrieval is based on references obtained from a document retrieved in the previous step. The request of the PHR is routed via the XIS to the XDS/XCA Gateway.

## Transaction sequences

### Document-based reports
For document-based content such as radiology reports, the interaction sequence consists of the first two steps as illustrated in Figure 1.

Step 1 – Query timeline
The PHR queries the document timeline via the XIS using MHD ITI-67.

Step 2 – Retrieve document
The PHR retrieves a certain report using MHD ITI-68.

In this scenario, ITI-67 is followed by ITI-68 and no imaging-specific transactions are involved. In the technical design, these transactions are described in the sections {{pagelink: TD, text: Query Timeline Data, anchor: QueryTimelineData}} and {{pagelink: TD, text: Retrieve Imaging Report, anchor: RetrieveImagingReport}}.

### Imaging studies
For imaging studies, the interaction sequence includes all three steps shown in Figure 1.

Step 1 – Query timeline
The PHR queries the document timeline via the XIS using MHD ITI-67.

Step 2 – Retrieve document
The PHR retrieves a certain document using MHD ITI-68. The response to this transaction is a [DICOM Key Object Selection (KOS) document](https://dicom.nema.org/medical/dicom/current/output/chtml/part03/sect_c.17.6.2.html), which contains references to the actual imaging instances.

Step 3 – Retrieve image
Based on the references provided in the KOS document, the PHR retrieves the imaging data using the WADO-RS transaction (RAD-107).

This sequence ensures that image retrieval is explicitly based on references obtained from the XDS environment and follows established IHE WIA patterns. In the technical design, these transactions are described in the sections {{pagelink: TD, text: Query Timeline Data, anchor: QueryTimelineData}} and {{pagelink: TD, text: Retrieve Images, anchor: RetrieveImages}}.

## Use of IHE Profiles
The following IHE profiles are used within this architecture:

- [Mobile Access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html) - used for querying document metadata and retrieving documents, including reports and imaging manifests.
- [Web-based Image Access (WIA)](https://wiki.ihe.net/index.php/Web-based_Image_Access) - used for retrieving imaging data via the WADO-RS transaction.

Each system implements the appropriate IHE actors as illustrated in Figure 1, ensuring a clear separation of responsibilities between consumer, intermediary and source roles.

## Security and authorization
Authentication between the PHR and the XIS relies on existing MedMij mechanisms and is outside the scope of this solution design.

For interactions between the XIS and the XDS/XCA Gateway, requests are secured using JWT-based authorization. The XIS enriches the JWT with claims aligned with the IHE Internet User Authorization (IUA) Profile. These claims provide the contextual information required to support authorization decisions within the XDS environment. More details are provided in the {{pagelink: RefArch, text: Reference architecture}}.