---
topic: Logical models
---

# Logical models

The functional dataset and the underlying use cases are represented by FHIR Logical Models.
- The Logical Models corresponding to the dataset, which we will refer to as *base Logical Models*, contain all functional concepts, including datatype, terminology binding (if applicable) and id (i.e. mapping to the [Nictiz BBS dataset (1.0.0-alpha.2)](https://decor.nictiz.nl/pub/bbs/bbs-html-20240208T092809/ds-2.16.840.1.113883.2.4.3.11.60.133.1.1-2022-03-09T122352.html) or, for newly introduced concepts, an id assigned by MedMij). Moreover, it is indicated whether each concept is repeating (i.e. whether its maximum cardinality is `1` or `*`).
- The Logical Models corresponding to a use case are derived from the base Logical Models. These indicate which concepts are (conditionally) required in the respective use case by setting the minimum cardinality to `1` (or adding a constraint which specifies when the concept is required). Furthermore, all concepts from the dataset that are part of the use case are flagged with a so-called *MustSupport* flag. Systems that exchange data in the context of the respective use case SHALL be able to convey these concepts. Concepts in the derived Logical Model that are not flagged in this way are technically not part of the use case, but MAY be conveyed in the context of that use case, nonetheless. Note that, strictly speaking, [the MustSupport flag is prohibited in type definitions](https://hl7.org/fhir/R4/elementdefinition.html#interpretation). However, [it is yet unclear whether this applies to (derived) Logical Models](https://chat.fhir.org/#narrow/channel/215610-shorthand/topic/Logical.20Models.20and.20not.20permitting.20MustSupport.20flag/near/366010787). Since we are interested in a clear and concise way of depicting the functional model, we still opted to use this flag (instead of e.g. using extensions).

## Dataset
### Patient
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient, buttons}}

### ImagingResearch
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-ImagingResearch, buttons}}

## Use case: Serve image and report timeline
Table 1 depicts the relevant building blocks in this use case.

| Building block | Cardinality |
| --- | --- |
| Patient | `1..1` |
| ImagingResearch | `1..*` |

**Table 1: Building blocks in the 'Serve image and report timeline' use case**

### Patient
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-timeline, buttons}}

### ImagingResearch
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-ImagingResearch-serve-timeline, buttons}}

## Use case: Serve image and report
Table 2 depicts the relevant building blocks in this use case.

| Building block | Cardinality |
| --- | --- |
| Patient | `1..1` |
| ImagingResearch | `1..*` |

**Table 2: Building blocks in the 'Serve image and report' use case**

### Patient
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-Patient-serve-image-report, buttons}}

### ImagingResearch
{{tree:http://medmij.nl/fhir/StructureDefinition/bbs-lm-ImagingResearch-serve-image-report, buttons}}