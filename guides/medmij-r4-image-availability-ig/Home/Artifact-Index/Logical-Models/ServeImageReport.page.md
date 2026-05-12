---
topic: ServeImageReport
---

## Use case: Serve image and report
Table 2 depicts the relevant building blocks in this use case.

| Building block | Logical Model | Cardinality |
| --- | --- | --- |
| Patient | BbsLmPatientServeImageReport | `1..1` |
| Study | BbsLmStudyServeTimeline | `1..*` |

**Table 2: Building blocks in the 'Serve image and report' use case**

### Patient
{{page: BbsLmPatientServeImageReport}}

### Study
{{page: BbsLmStudyServeImageReport}}