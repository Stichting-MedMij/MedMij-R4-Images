//Bundle with FHIR test instances in FSH format for "Beeld in PGO" test scenario 4

Instance: Images-Patient-Tjong-A-Kon
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient
Usage: #example
* identifier
  * system = "http://fhir.nl/fhir/NamingSystem/bsn"
  * value = "267384488" // gegenereerd "fake" BSN
* name
  * use = #official
  * text = "Xi Tjong A Kon"
  * family = "Tjong A Kon"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Tjong A Kon"
  * given = "Xi"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #BR
* birthDate = "2000-09-09"