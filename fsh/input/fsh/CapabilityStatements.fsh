// CapabilityStatements based on ITI MHD used in Image Availability

Instance: bbs-Retrieve
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstance
* name = "bbs Retrieve"
* status = #active
* date = "2026-05-13"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a client to fulfill the 'Retrieve image and report timeline' and 'Retrieve image and report' transactions within Image Availability. It is partly based on the CapabilityStatement defined by IHE ITI for the [Document Consumer](https://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentConsumer)."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #client
  * documentation = "Minimal requirements for a client to fulfill the 'Retrieve image and report timeline' and 'Retrieve image and report' transactions (system role: MM-1.0-BR-FHIR)."
  * resource[+]
    * type = #DocumentReference
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference"
    * interaction
      * code = #search-type
    * searchParam[0]
      * name = "status"
      * type = #token
      * documentation = "Only approved documents are to be exchanged, hence only searching on the value *current* needs to be supported."
    * searchParam[1]
      * name = "contenttype"
      * type = #token
  * resource[+]
    * type = #Binary
    * interaction
      * code = #read
  * resource[+]
    * type = #Patient
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Practitioner
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Organization
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * resource[+]
    * type = #Encounter
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server includes this (secondary) resource in the Bundle, the client does not need to execute a `read`. However, since a server may choose to not include it in the Bundle, support of the `read` interaction is mandatory for a client."
  * interaction
    * code = #search-system

Instance: bbs-Serve
InstanceOf: CapabilityStatement
Usage: #definition
* insert DefaultNarrativeInstance
* name = "bbs Serve"
* status = #active
* date = "2026-05-13"
* insert PublisherAndContactInstance
* description = "This CapabilityStatement describes the minimal requirements for a server to fulfill the 'Serve image and report timeline' and 'Serve image and report' transactions within Image Availability. It is partly based on the CapabilityStatement defined by IHE ITI for the [Document Responder](https://profiles.ihe.net/ITI/MHD/CapabilityStatement/IHE.MHD.DocumentResponder)."
* purpose = "This CapabilityStatement is informative in nature and does not represent the minimum or maximum set of capabilities the client or server should support. The aim is to design the CapabilityStatement as complete as possible, however for the exact set of capabilities the implementation guide should be consulted."
* insert CopyrightInstance
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #xml
* format[1] = #json
* rest
  * mode = #server
  * documentation = "Minimal requirements for a server to fulfill the 'Serve image and report timeline' and 'Serve image and report' transactions (system role: MM-1.0-BB-FHIR)."
  * resource[+]
    * type = #DocumentReference
    * supportedProfile = "http://medmij.nl/fhir/StructureDefinition/bbs-DocumentReference"
    * interaction
      * code = #search-type
    * searchParam[0]
      * name = "status"
      * type = #token
      * documentation = "Only approved documents are to be exchanged, hence only searching on the value *current* needs to be supported."
    * searchParam[1]
      * name = "contenttype"
      * type = #token
  * resource[+]
    * type = #Binary
    * interaction
      * code = #read
  * resource[+]
    * type = #Patient
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #PractitionerRole
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-PractitionerRole"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Practitioner
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthProfessional-Practitioner"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Organization
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-HealthcareProvider-Organization"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * resource[+]
    * type = #Encounter
    * supportedProfile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Encounter"
    * documentation = "This is a secondary resource that needs to be resolvable, either by supporting a `read` interaction or explicitly including it in the Bundle."
    * interaction
      * code = #read
      * documentation = "If the server always includes this (secondary) resource in the Bundle, support of the `read` interaction is optional."
  * interaction
    * code = #search-system