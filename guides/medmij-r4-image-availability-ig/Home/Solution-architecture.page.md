# Solution Architecture

## Scope and Context
This solution design describes the architecture and interaction patterns for making medical documents and imaging studies available to a Personal Health Record (PHR) within the MedMij Image Availability context.

The architecture covers the interaction between the PHR, an XIS, and an XDS/XCA Gateway that provides access to an underlying XDS environment. The design is based on established IHE profiles and aligns with MedMij principles for interoperability and controlled access.

This solution architecture focuses on the architectural flow and responsibilities. Detailed descriptions of individual transactions and message content are defined in the Technical design section of this MedMij Image Availability Implementation Guide.

See:
[Technical design](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design.page.md)

## Architectural Overview
The architecture follows a layered and mediated approach in which the PHR communicates exclusively with the XIS. The XIS mediates access to the XDS domain through an XDS/XCA Gateway. This separation ensures that the PHR is not exposed to XDS-specific complexity and that protocol handling and access control are handled centrally.

Figure 1 provides an overview of the participating systems, their responsibilities, and the interactions required to support document and image availability.

{{render: guides/medmij-r4-image-availability-ig/images/Solution architecture overview.png}}
### **Figure 1 – Solution Architecture for Image Availability**

Overview of the interaction between the PHR, XIS, and XDS/XCA Gateway. The figure illustrates the use of MHD and WIA transactions for querying document metadata, retrieving documents, and accessing imaging data.

## Interaction Model
As shown in Figure 1, the interaction model consists of three main interaction steps. All interactions are initiated by the PHR and routed via the XIS to the XDS/XCA Gateway.

Step 1 – Query timeline  
The PHR queries the document timeline to obtain an overview of available reports and imaging studies. This step uses the MHD ITI-67 transaction.

Step 2 – Retrieve document  
Based on the timeline data, the PHR retrieves a selected document, such as a radiology report or an imaging manifest. This step uses the MHD ITI-68 transaction.

Step 3 – Retrieve image  
For imaging studies, the PHR retrieves image data using DICOMweb. Image retrieval is based on references obtained from a previously retrieved document.

## Transaction Sequences

### Document-Based Reports
For document-based content such as radiology reports, the interaction sequence consists of steps 1 and 2 as illustrated in Figure 1.

Step 1 – Query timeline  
The PHR queries the document timeline via the XIS using MHD ITI-67.

Step 2 – Retrieve document  
The PHR retrieves the selected report using MHD ITI-68. The XIS forwards both requests to the XDS/XCA Gateway, which retrieves the required data from the XDS environment and returns the responses via the XIS to the PHR.

In this scenario, ITI-67 is followed by ITI-68 and no imaging-specific transactions are involved.

See:
[Query Timeline Data (MHD ITI-67)](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design.page.md?#query-timeline-data-mhd-iti-67)  
[Retrieve Imaging Report (MHD ITI-68)](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design.page.md?#retrieve-imaging-report-mhd-iti-68)

### Imaging Studies
For imaging studies, the interaction sequence includes all three steps shown in Figure 1.

Step 1 – Query timeline  
The PHR queries the document timeline using MHD ITI-67.

Step 2 – Retrieve document  
The PHR retrieves a document using MHD ITI-68. The response to this transaction is a DICOM Key Object Selection (KOS) object, which contains references to the actual imaging instances.

Step 3 – Retrieve image  
Based on the references provided in the KOS object, the PHR retrieves the imaging data using the WADO-RS transaction (RAD-107). The request is routed via the XIS to the XDS/XCA Gateway.

This sequence ensures that image retrieval is explicitly based on references obtained from the XDS environment and follows established IHE WIA patterns.

See:
[Query Timeline Data (MHD ITI-67)](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design.page.md?#query-timeline-data-mhd-iti-67)  
[Retrieve Images (MHD ITI-68 and WADO-RS RAD-107)](https://simplifier.net/guide/medmij-r4-image-availability-ig/Home/Technical-design.page.md?#retrieve-images-mhd-iti-68-and-wado-rs-rad-107)

## Use of IHE Profiles
The following IHE profiles are used within this architecture:

- [Mobile Access to Health Documents (MHD)](https://profiles.ihe.net/ITI/MHD/index.html)  
  Used for querying document metadata and retrieving documents, including reports and imaging manifests.

- [Web-based Image Access (WIA)](https://wiki.ihe.net/index.php/Web-based_Image_Access)
  Used for retrieving imaging data via the DICOMweb WADO-RS transaction.

Each system implements the appropriate IHE actors as illustrated in Figure 1, ensuring a clear separation of responsibilities between consumer, intermediary, and source roles.

## Security and Authorisation
Authentication between the PHR and the XIS relies on existing MedMij mechanisms and is outside the scope of this solution design.

For interactions between the XIS and the XDS/XCA Gateway, requests are secured using JWT-based authorisation. The XIS enriches the JWT with claims aligned with the IHE Internet User Authorization (IUA) profile. These claims provide the contextual information required to support authorisation decisions within the XDS environment.