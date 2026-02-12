// FHIR test instances in FSH format for Image Availability test scenario 4

Instance: ImageAvailability-Patient-Tjong-A-Kon
InstanceOf: http://nictiz.nl/fhir/StructureDefinition/nl-core-Patient
Usage: #example
* identifier
  * system = $BSN
  * value.extension[http://hl7.org/fhir/StructureDefinition/data-absent-reason].valueCode = #masked // gemaskeerd BSN
* name[nameInformation]
  * use = #official
  * text = "Xi Tjong A Kon"
  * family = "Tjong A Kon"
    * extension[http://hl7.org/fhir/StructureDefinition/humanname-own-name].valueString = "Tjong A Kon"
  * given = "Xi"
    * extension[http://hl7.org/fhir/StructureDefinition/iso21090-EN-qualifier].valueCode = #BR
* birthDate = "2000-09-09"