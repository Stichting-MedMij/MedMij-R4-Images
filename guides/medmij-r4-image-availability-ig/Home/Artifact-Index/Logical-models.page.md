---
topic: LM
---

# Logical Models

Logical Models represent data structures, and contain data elements and their constraints and relationships. They allow data requirements to be described from a functional perspective. In this IG, the functional dataset and the underlying use cases are represented by [FHIR Logical Models](http://hl7.org/fhir/R5/logical.html) (note that this link redirects to the R5 specification, as there is no dedicated page for Logical Models in the R4 specification). These use FHIR to capture the data structures (namely by specifying a [StructureDefinition](https://hl7.org/fhir/R4/structuredefinition.html) and underlying [ElementDefinitions](https://hl7.org/fhir/R4/elementdefinition.html), for each data structure), but they are not (directly) attached to FHIR resources.

- The Logical Models corresponding to the dataset, which we will refer to as *base Logical Models*, contain all functional concepts, including corresponding datatype, terminology binding (if applicable) and an id.
  - For existing concepts from the [Nictiz BBS dataset (1.0.0-alpha.2)](https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html), the specified id constitutes a mapping to that dataset, while for newly introduced concepts, an id is assigned by MedMij. These ids are also added as mappings in the {{pagelink: FHIR, text: FHIR profiles}}, and therefore form the linking pin between Logical Models and FHIR profiles.
  - For each concept it is indicated whether it is repeating (i.e. by setting its maximum cardinality to `1` or `*`).
  - The [FHIR datatypes](https://hl7.org/fhir/R4/datatypes.html) are used in the Logical Models, even though these might bring 'physical' constraints, formats, etc. into the abstract logical data models which are not intended or applicable on the logical level. For instance, elements of the Attachment datatype need to satisfy the *att-1* constraint, which states that the element SHALL have a `contentType`, provided the element has non-empty `data`. Even though this constraint makes sense on a technical level, the aforementioned attributes `contentType` and `data` are not present in a logical data model. Therefore, such constraints may be 'ignored' in the Logical Models; instead, these constraints are taken into account in the corresponding FHIR profiles.
- The Logical Models corresponding to a use case are derived from the base Logical Models, and are therefore called *derived Logical Models*.
  - These indicate which concepts are (conditionally) required in the respective use case by setting the minimum cardinality to `1` (or adding a constraint which specifies when the concept is required).
  - All concepts from the dataset that are part of the use case are indicated with a so-called *Must Support* flag. Systems that exchange data in the context of the respective use case SHALL be able to convey these concepts. Concepts in the derived Logical Model that are not flagged in this way are technically not part of the use case, but MAY be conveyed in the context of that use case, nonetheless. Note that, strictly speaking, [the Must Support flag is prohibited in type definitions](https://hl7.org/fhir/R4/elementdefinition.html#interpretation). However, [it is yet unclear whether this applies to (derived) Logical Models](https://chat.fhir.org/#narrow/channel/215610-shorthand/topic/Logical.20Models.20and.20not.20permitting.20MustSupport.20flag). Since we are mainly interested in a clear and concise way of depicting the functional model, we still opted to use this flag (instead of e.g. using extensions).
- For all Logical Models the scope is implicitly set to a single patient (with the exception of the Patient Logical Model, in which the scope is explicit). This relation is not explicitly modeled, similar to the approach of the [zibs](https://zibs.nl/wiki/HCIM_Release_2020(EN)).

Base Logical Models and derived Logical Models can (also) be distinguished from each other by the value of `.abstract`, as this element attains the value *true* and *false* for these Logical Models, respectively.

## Dataset
### Patient
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient}}
    </tab>
</tabs>

### Study
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study}}
    </tab>
</tabs>

## Use case: Serve image and report timeline
Table 1 depicts the relevant building blocks in this use case.

| Building block | Logical Model | Cardinality |
| --- | --- | --- |
| Patient | LmPatientServeTimeline | `1..1` |
| Study | LmStudyServeTimeline | `1..*` |

**Table 1: Building blocks in the 'Serve image and report timeline' use case**

### Patient
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-timeline, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-timeline}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-timeline}}
    </tab>
</tabs>

### Study
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-timeline, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-timeline}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-timeline}}
    </tab>
</tabs>

## Use case: Serve image and report
Table 2 depicts the relevant building blocks in this use case.

| Building block | Logical Model | Cardinality |
| --- | --- | --- |
| Patient | LmPatientServeImageReport | `1..1` |
| Study | LmStudyServeTimeline | `1..*` |

**Table 2: Building blocks in the 'Serve image and report' use case**

### Patient
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-image-report, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-image-report}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-image-report}}
    </tab>
</tabs>

### Study
<tabs>
    <tab title="Tree view" active="true">
      {{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-image-report, buttons}}
    </tab>
    <tab title="Xml">
      {{xml:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-image-report}}
    </tab>
    <tab title="Json">
      {{json:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Study-serve-image-report}}
    </tab>
</tabs>