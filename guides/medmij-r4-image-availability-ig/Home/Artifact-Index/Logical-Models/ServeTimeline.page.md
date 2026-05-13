---
topic: ServeTimeline
---

## Use case: Serve image and report timeline
Table 1 depicts the relevant building blocks in this use case.

| Building block | Logical Model | Cardinality |
| --- | --- | --- |
| Patient | BbsLmPatientServeTimeline | `1..1` |
| Study | BbsLmStudyServeTimeline | `1..*` |

**Table 1: Building blocks in the 'Serve image and report timeline' use case**

### Patient
{{page: BbsLmPatientServeTimeline}}

### Study
{{page: BbsLmStudyServeTimeline}}