//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 4

Instance: Images-Patient-Tjon-A-Kon
InstanceOf: Patient
Usage: #example
* meta.profile = "http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient"
* identifier.system = "http://fhir.nl/fhir/NamingSystem/bsn"
* identifier.value = "267384488" // gegenereerd "fake" BSN
* name[0].text = "Xi Tjong A Kon"
* name[0].family = "Tjong A Kon"
* name[0].given = "Xi"
* birthDate = "2000-09-09"