Profile:        IhrisPage
Parent:         Basic
Id:             ihris-page
Title:          "iHRIS Page"
Description:    "iHRIS Profile of the Basic resource to manage pages."
* code = IhrisResourceCodeSystem#page
* extension contains
      IhrisPageDisplay named display 1..1 MS and
      IhrisPageSection named section 0..* MS

Extension:      IhrisPageDisplay
Id:             ihris-page-display
Title:          "iHRIS Page Display"
Description:    "iHRIS Page Display details."
* ^context.type = #element
* ^context.expression = IhrisPage
* extension contains
      resource 1..1 MS and
      search 1..* MS and
      filter 1..* MS
* extension[resource].value[x] only Reference
* extension[resource].valueReference only Reference(StructureDefinition)
* extension[resource].valueReference 1..1 MS
* extension[resource].valueReference ^label = "Primary Resource"
* extension[search].value[x] only string
* extension[search].valueString 1..1 MS
* extension[search].valueString ^label = "Search Headers"
* extension[filter].value[x] only string
* extension[filter].valueString 1..1 MS
* extension[filter].valueString ^label = "Search Filters"

Extension:      IhrisPageSection
Id:             ihris-page-section
Title:          "iHRIS Page Section"
Description:    "iHRIS Page Section information."
* ^context.type = #element
* ^context.expression = IhrisPage
* extension contains
      title 1..1 MS and
      description 1..1 MS and
      name 1..1 MS and
      field 0..* MS and
      resource 0..1 MS and
      linkfield 0..1 MS
* extension[title].value[x] only string
* extension[title].valueString MS
* extension[title].valueString ^label = "Title"
* extension[description].value[x] only string
* extension[description].valueString 1..1 MS
* extension[description].valueString ^label = "Description"
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Name"
* extension[field].value[x] only string
* extension[field].valueString 1..1 MS
* extension[field].valueString ^label = "Name"
* extension[resource].value[x] only Reference
* extension[resource].valueReference only Reference(StructureDefinition)
* extension[resource].valueReference MS
* extension[resource].valueReference ^label = "Secondary Resource"
* extension[linkfield].value[x] only string
* extension[linkfield].valueString MS
* extension[linkfield].valueString ^label = "Secondary Resource Link Field"

Extension:      IhrisPageSectionResource
Id:             ihris-page-section-resource
Title:          "iHRIS Page Section Resource"
Description:    "iHRIS Page Section Resource information."
* ^context.type = #element
* ^context.expression = IhrisPageSection

Instance:       ihris-page-practitioner
InstanceOf:     IhrisPage
Title:          "iHRIS Practitioner Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-personal-information)
* extension[display].extension[search][0].valueString = "Surname|name.where(use='official').extension:familyNames.extension:fathers"
* extension[display].extension[search][1].valueString = "Given Name(s)|name.where(use='official').given"
* extension[display].extension[search][2].valueString = "Birth Date|birthDate"
* extension[display].extension[search][3].valueString = "Gender|gender"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Gender|gender"
* extension[section][0].extension[title].valueString = "Health Worker"
* extension[section][0].extension[description].valueString = "Primary demographic details"
* extension[section][0].extension[name].valueString = "Practitioner"
* extension[section][0].extension[field][0].valueString = "Practitioner.name"
* extension[section][0].extension[field][1].valueString = "Practitioner.name.given"
* extension[section][0].extension[field][2].valueString = "Practitioner.name.extension:familyNames"
* extension[section][0].extension[field][3].valueString = "Practitioner.birthDate"
* extension[section][0].extension[field][4].valueString = "Practitioner.gender"
* extension[section][0].extension[field][5].valueString = "Practitioner.extension:maritalStatus"
* extension[section][0].extension[field][6].valueString = "Practitioner.extension:nationality"
* extension[section][0].extension[field][7].valueString = "Practitioner.extension:ethnicity"
* extension[section][0].extension[field][8].valueString = "Practitioner.extension:residence"
* extension[section][1].extension[title].valueString = "Identifiers"
* extension[section][1].extension[description].valueString = "Personal identifiers"
* extension[section][1].extension[name].valueString = "identifiers"
* extension[section][1].extension[field][0].valueString = "Practitioner.identifier"
* extension[section][1].extension[field][1].valueString = "Practitioner.identifier.use"
* extension[section][1].extension[field][2].valueString = "Practitioner.identifier.type"
* extension[section][1].extension[field][3].valueString = "Practitioner.identifier.value"
* extension[section][1].extension[field][4].valueString = "Practitioner.identifier.system"
* extension[section][2].extension[title].valueString = "Contact Details"
* extension[section][2].extension[description].valueString = "email, phone numbers"
* extension[section][2].extension[name].valueString = "contact"
* extension[section][2].extension[field][0].valueString = "Practitioner.telecom"
* extension[section][3].extension[title].valueString = "Language Details"
* extension[section][3].extension[description].valueString = "Languages spoken"
* extension[section][3].extension[name].valueString = "language"
* extension[section][3].extension[field][0].valueString = "Practitioner.communication"
* extension[section][4].extension[title].valueString = "Dependents Details"
* extension[section][4].extension[description].valueString = "Dependents"
* extension[section][4].extension[name].valueString = "dependents"
* extension[section][4].extension[field][0].valueString = "Practitioner.extension:dependents"
* extension[section][5].extension[title].valueString = "Education Details"
* extension[section][5].extension[description].valueString = "Education Major Information"
* extension[section][5].extension[name].valueString = "educationalMajor"
* extension[section][5].extension[field][0].valueString = "Practitioner.extension:educationalMajor"
* extension[section][6].extension[title].valueString = "License Details"
* extension[section][6].extension[description].valueString = "Professional License Category Information"
* extension[section][6].extension[name].valueString = "professionalLicenseCategory"
* extension[section][6].extension[field][0].valueString = "Practitioner.extension:professionalLicenseCategory"
* extension[section][7].extension[title].valueString = "Training Details"
* extension[section][7].extension[description].valueString = "Special Training Information"
* extension[section][7].extension[name].valueString = "specialTraining"
* extension[section][7].extension[field][0].valueString = "Practitioner.extension:specialTraining"
* extension[section][8].extension[title].valueString = "Category Details"
* extension[section][8].extension[description].valueString = "Category Information"
* extension[section][8].extension[name].valueString = "category"
* extension[section][8].extension[field][0].valueString = "Practitioner.extension:category"
* extension[section][9].extension[title].valueString = "Remarks"
* extension[section][9].extension[description].valueString = "Remarks or Notes "
* extension[section][9].extension[name].valueString = "remarks"
* extension[section][9].extension[field][0].valueString = "Practitioner.extension:remarkNote"
* extension[section][10].extension[title].valueString = "Position"
* extension[section][10].extension[description].valueString = "Position the person holds"
* extension[section][10].extension[name].valueString = "position"
* extension[section][10].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][10].extension[resource].valueReference = Reference(StructureDefinition/ihris-job-description)
* extension[section][10].extension[linkfield].valueString = "PractitionerRole.practitioner"
