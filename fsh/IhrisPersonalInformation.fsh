Profile:        IhrisPractitioner
Parent:         Practitioner
Id:             ihris-personal-information
Title:          "iHRIS Personal Information"
Description:    "iHRIS profile of Practitioner."
* identifier MS
* identifier ^label = "Identifier"
* identifier.system MS
* identifier.system ^label = "System"
* identifier.value MS
* identifier.value ^label = "Value"
* identifier.type MS
* identifier.type ^label = "Type"
* name 1..1 MS
* name ^label = "Name"
* name.use MS
* name.use ^label = "Use"
* name.given MS
* name.given ^label = "Given Name"
* name.prefix MS
* name.prefix ^label = "Prefix"
* name.suffix MS
* name.suffix ^label = "Suffix"
* birthDate MS
* birthDate ^label = "Birth Date"
* gender 1..1 MS
* gender ^label = "Gender"
* telecom MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* communication 0..0
* extension contains
    IhrisPractitionerFatherName named fatherName 0..1 MS and
    IhrisPractitionerGrandFatherName named grandFatherName 0..1 MS and
    IhrisPractitionerMotherName named motherName 0..1 MS and
    IhrisPractitionerNameAlternativeLanguage named nameAlternativeLanguage 0..1 MS and
    IhrisPractitionerFatherAlternativeLanguage named fatherAlternativeLanguage 0..1 MS and
    IhrisPractitionerGrandFatherAlternativeLanguage named grandFatherAlternativeLanguage 0..1 MS and
    IhrisPractitionerProfessionalLicenseCategory named professionalLicenseCategory 0..* MS and
    IhrisPractitionerMaritalStatus named maritalStatus 0..1 MS and
    IhrisPractitionerDependents named dependents 0..* MS and
    IhrisPractitionerLanguage named language 0..* MS and
    IhrisPractitionerSpecialTraining named specialTraining 0..* MS and
    IhrisPractitionerRemarkNote named remarkNote 0..* MS and
    IhrisPractitionerResidence named residence 0..1 MS and
    IhrisPractitionerNationality named nationality 0..1 MS and
    IhrisPractitionerEducationalMajor named educationalMajor 0..1 MS and
    IhrisPractitionerCategory named category 0..1 MS and
    IhrisPractitionerEthnicity named ethnicity 0..1 MS and
    IhrisPractitionerEmployeeId named employeeId 0..1 MS and
    IhrisPractitionerPensionNumber named pensionNumber 0..1 MS and
    IhrisPractitionerTinNumber named tinNumber 0..1 MS and
    IhrisPractitionerDrivingLicenseId named drivingLicenseId 0..1 MS and
    IhrisPractitionerCivilServiceId named civilServiceId 0..1 MS and
    IhrisPractitionerLicenseId named licenseId 0..1 MS
* extension[fatherName].valueString MS
* extension[fatherName] ^label = "Father Name"
* extension[grandFatherName].valueString MS
* extension[grandFatherName] ^label = "Grand Father Name"
* extension[motherName].valueString MS
* extension[motherName] ^label = "Mother Name"
* extension[nameAlternativeLanguage].valueString MS
* extension[nameAlternativeLanguage] ^label = "First Name Alternative Language"
* extension[fatherAlternativeLanguage].valueString MS
* extension[fatherAlternativeLanguage] ^label = "Father Name Alternative Language"
* extension[grandFatherAlternativeLanguage].valueString MS
* extension[grandFatherAlternativeLanguage] ^label = "Grand Father Name Alternative Language"
* extension[residence].valueReference.reference MS
* extension[nationality].valueCoding MS
* extension[nationality] ^label = "Nationality"
* extension[dependents].valueString MS
* extension[dependents] ^label = "Dependents"
* extension[maritalStatus].valueCoding MS
* extension[maritalStatus] ^label = "Marital Status"
* extension[language].valueCoding MS
* extension[language] ^label = "Language"
* extension[specialTraining].valueString  MS
* extension[specialTraining] ^label = "Special Training"
* extension[professionalLicenseCategory].valueString MS
* extension[professionalLicenseCategory] ^label = "Professional License Category"
* extension[educationalMajor].valueCoding MS
* extension[educationalMajor] ^label = "Educational Major"
* extension[category].valueCoding MS
* extension[category] ^label = "Category"
* extension[remarkNote].valueString MS
* extension[remarkNote] ^label = "Remark Note"
* extension[ethnicity].valueCoding MS
* extension[ethnicity] ^label = "Ethnicity"
* extension[employeeId].valueString MS
* extension[employeeId] ^label = "Employee Id"
* extension[pensionNumber].valueString MS
* extension[pensionNumber] ^label = "Pension Number"
* extension[tinNumber].valueString MS
* extension[tinNumber] ^label = "Tin Number"
* extension[drivingLicenseId].valueString MS
* extension[drivingLicenseId] ^label = "Driving License Id"
* extension[civilServiceId].valueString MS
* extension[civilServiceId] ^label = "Civil Service Id"
* extension[licenseId].valueString MS
* extension[licenseId] ^label = "License Id"

Extension:      IhrisPractitionerFatherName
Id:             ihris-personal-information-father-name
Title:          "iHRIS Personal Information Father Name"
Description:    "iHRIS extension for father name."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Father Name"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerGrandFatherName
Id:             ihris-personal-information-grand-father-name
Title:          "iHRIS Personal Information Grand Father Name"
Description:    "iHRIS extension for grand father name."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Grand Father Name"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerMotherName
Id:             ihris-personal-information-mother-name
Title:          "iHRIS Personal Information Mother Name"
Description:    "iHRIS extension for mother name."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Mother Name"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerNameAlternativeLanguage
Id:             ihris-personal-information-name-alternative-language
Title:          "iHRIS Personal Information Name Alternative Language"
Description:    "iHRIS extension for name alternative language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "First Name Alternative Language"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerFatherAlternativeLanguage
Id:             ihris-personal-information-father-alternative-language
Title:          "iHRIS Personal Information Father Alternative Language"
Description:    "iHRIS extension for father alternative language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Father Name Alternative Language"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerGrandFatherAlternativeLanguage
Id:             ihris-personal-information-grand-father-alternative-language
Title:          "iHRIS Personal Information grand father alternative language"
Description:    "iHRIS extension for grand father alternative language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Grand Father Name Alternative Language"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerProfessionalLicenseCategory
Id:             ihris-personal-information-professional-license-category
Title:          "iHRIS Personal Information Professional License Category"
Description:    "iHRIS extension for Professional License Category."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Professional License Category"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerSpecialTraining
Id:             ihris-personal-information-special-training
Title:          "iHRIS Personal Information Special Training"
Description:    "iHRIS extension for Special Training."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Special Training"
* value[x] only string
* valueString 1..1 MS
Extension:      IhrisPractitionerRemarkNote
Id:             ihris-personal-information-remark-note
Title:          "iHRIS Personal Information Remark Note"
Description:    "iHRIS extension for Remark Note."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString ^label = "Remarks/Note"
* valueString 1..1 MS
Extension:      IhrisPractitionerResidence
Id:             ihris-practitioner-residence
Title:          "iHRIS Practitioner Residence "
Description:    "iHRIS extension for Practitioner Residence."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Residence"
* valueReference only Reference(Location)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0
Extension:      IhrisPractitionerLanguage
Id:             ihris-practitioner-language
Title:          "iHRIS Personal Information Language"
Description:    "iHRIS extension for Personal Information Language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Language"
* valueCoding from IhrisLanguageValueSet (required)
CodeSystem:      IhrisLanguageCodeSystem
Id:              ihris-language-codesystem
Title:           "iHRIS Language CodeSystem"
* #english "English" "English"
* #amharic "Amharic" "Amharic"
* #oromiffa "Afaan Oromoo" "Afaan Oromoo"
* #somali "Somali" "Somali"
* #tigrinya "Tigrinya" "Tigrinya"
ValueSet:         IhrisLanguageValueSet
Id:               ihris-language-valueset
Title:            "iHRIS Language ValueSet"
* codes from system IhrisLanguageCodeSystem
Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueCoding ^label = "Nationality"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)
Extension:      IhrisPractitionerEducationalMajor
Id:             ihris-practitioner-educational-major
Title:          "iHRIS Personal Information Educational Major"
Description:    "iHRIS extension for Personal Information Educational Major."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Educational Major"
* valueCoding from IhrisEducationalMajorValueSet (required)
CodeSystem:      IhrisEducationalMajorCodeSystem
Id:              ihris-educational-major-codesystem
Title:           "iHRIS Educational Major CodeSystem"
* #emergencyMedicalTech "Emergency Medical Tech" "Emergency Medical Tech"
* #medicalSurgicalAssistant "Medical/Surgical Assistant" "Medical/Surgical Assistant"
* #medicalLabTech "Medical Lab/Tech" "Medical Lab/Tech"
* #medicine "Medicine" "Medicine"
* #nursing "Nursing" "Nursing"
* #pharmacy "Pharmacy" "Pharmacy"
* #otherHealthProfessions "Other Health Professions" "Other Health Professions"
ValueSet:         IhrisEducationalMajorValueSet
Id:               ihris-educational-major-valueset
Title:            "iHRIS Educational Major ValueSet"
* codes from system IhrisEducationalMajorCodeSystem
Extension:      IhrisPractitionerCategory
Id:             ihris-personal-Information-Category
Title:          "iHRIS Personal Information Category"
Description:    "iHRIS extension for Personal Information Category."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Category"
* valueCoding from IhrisCategoryValueSet (required)
CodeSystem:      IhrisCategoryCodeSystem
Id:              ihris-category-codesystem
Title:           "iHRIS Category CodeSystem"
* #professional "Professional" "Professional"
* #administrative "Administrative" "Administrative"
* #academic "Academic" "Academic"
ValueSet:         IhrisCategoryValueSet
Id:               ihris-category-valueset
Title:            "iHRIS Category ValueSet"
* codes from system IhrisCategoryCodeSystem
Extension:      IhrisPractitionerMaritalStatus
Id:             ihris-practitioner-marital-status
Title:          "iHRIS Practitioner Marital Status"
Description:    "iHRIS extension for Practitioner marital status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Marital Status"
* valueCoding from http://hl7.org/fhir/ValueSet/marital-status (required)
Extension:      IhrisPractitionerDependents
Id:             ihris-practitioner-dependents
Title:          "iHRIS Practitioner Dependents"
Description:    "iHRIS extension for Practitioner number of dependents."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 1..1 MS
* valueString ^label = "Dependents"
Extension:      IhrisPractitionerEthnicity
Id:             ihris-practitioner-ethnicity
Title:          "iHRIS Personal Information Ethnicity"
Description:    "iHRIS extension for Personal Information Ethnicity."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Ethnicity"
* valueCoding from IhrisEthnicityValueSet (required)
CodeSystem:      IhrisEthnicityCodeSystem
Id:              ihris-Ethnicity-codesystem
Title:           "iHRIS Ethnicity CodeSystem"
* #bench "Bench" "Bench"
* #berta "Berta" "Berta"
* #betaIsrael "Beta Israel" "Beta Israel"
* #bodi "Bodi" "Bodi"
* #brayle "Brayle" "Brayle"
* #burji "Burji" "Burji"
* #chara "Chara" "Chara"
* #daasanach "Daasanach" "Daasanach"
* #dawro "Dawro" "Dawro"
* #debaseGawwada "Debase/Gawwada" "Debase/Gawwada"
* #dime "Dime" "Dime"
* #dirashe "Dirashe" "Dirashe"
* #dizi "Dizi" "Dizi"
* #donga "Donga" "Donga"
* #fedashe "Fedashe" "Fedashe"
* #gamo "Gamo" "Gamo"
* #gebato "Gebato" "Gebato"
* #gedeo "Gedeo" "Gedeo"
* #gedicho "Gedicho" "Gedicho"
* #gidole "Gidole" "Gidole"
* #goffa "Goffa" "Goffa"
* #gumuz "Gumuz" "Gumuz"
* #gurage "Gurage" "Gurage"
* #hadiya "Hadiya" "Hadiya"
* #hamar "Hamar" "Hamar"
* #harari "Harari" "Harari"
* #irob "Irob" "Irob"
* #kafficho "Kafficho" "Kafficho"
* #kambaata "Kambaata" "Kambaata"
* #karo "Karo" "Karo"
* #komo "Komo" "Komo"
* #konso "Konso" "Konso"
* #konta "Konta" "Konta"
* #kontoma "Kontoma" "Kontoma"
* #koore "Koore" "Koore"
* #kunama "Kunama" "Kunama"
* #kusumie "Kusumie" "Kusumie"
* #kwegu "Kwegu" "Kwegu"
* #majangir "Majangir" "Majangir"
* #male "Male" "Male"
* #mao "Mao" "Mao"
* #mareqo "Mareqo" "Mareqo"
* #mashola "Mashola" "Mashola"
* #meen "Me'en" "Me'en"
* #merePeople "Mere people" "Mere people"
* #messengo "Messengo" "Messengo"
* #mossiye "Mossiye" "Mossiye"
* #murle "Murle" "Murle"
* #mursi "Mursi" "Mursi"
* #nao "Nao" "Nao"
* #nuer "Nuer" "Nuer"
* #nyangatom "Nyangatom" "Nyangatom"
* #oromo "Oromo" "Oromo"
* #oyda "Oyda" "Oyda"
* #qebena "Qebena" "Qebena"
* #qechem "Qechem" "Qechem"
* #qewama "Qewama" "Qewama"
* #she "She" "She"
* #shekecho "Shekecho" "Shekecho"
* #sheko "Sheko" "Sheko"
* #shinasha "Shinasha" "Shinasha"
* #shitaUpo "Shita/Upo" "Shita/Upo"
* #sidama "Sidama" "Sidama"
* #silte "Silt'e" "Silt'e"
* #somali "Somali" "Somali"
* #surma "Surma" "Surma"
* #tembaro "Tembaro" "Tembaro"
* #tigrinya "Tigrinya" "Tigrinya"
* #tsamai "Tsamai" "Tsamai"
* #welayta "Welayta" "Welayta"
* #werji "Werji" "Werji"
* #yem "Yem" "Yem"
* #zelmam "Zelmam" "Zelmam"
* #zeyese "Zeyese" "Zeyese"
* #otherUnknown "Other/unknown" "Other/unknown"
* #somalian "Somalian" "Somalian"
* #sudanese "Sudanese" "Sudanese"
* #eritrean "Eritrean" "Eritrean"
* #kenyan "Kenyan" "Kenyan"
* #djiboutian "Djiboutian" "Djiboutian"
* #otherForeigners "Other foreigners" "Other foreigners"

ValueSet:         IhrisEthnicityValueSet
Id:               ihris-Ethnicity-valueset
Title:            "iHRIS Ethnicity ValueSet"
* codes from system IhrisEthnicityCodeSystem

Extension:      IhrisPractitionerEmployeeId
Id:             ihris-personal-information-employee-id
Title:          "iHRIS Personal Information Employee Id"
Description:    "iHRIS extension for Employee Id."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Employee Id"
* value[x] only string
* valueString 1..1 MS

Extension:      IhrisPractitionerPensionNumber
Id:             ihris-personal-information-pension-number
Title:          "iHRIS Personal Information Pension Number"
Description:    "iHRIS extension for pension number."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Pension Number"
* value[x] only string
* valueString 1..1 MS

Extension:      IhrisPractitionerTinNumber
Id:             ihris-personal-information-tin-number
Title:          "iHRIS Personal Information Tin Number"
Description:    "iHRIS extension for tin number."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Tin Number"
* value[x] only string
* valueString 1..1 MS

Extension:      IhrisPractitionerDrivingLicenseId
Id:             ihris-personal-information-driving-license-id
Title:          "iHRIS Personal Information Driving License Id"
Description:    "iHRIS extension for driving license id."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Driving License Id"
* value[x] only string
* valueString 1..1 MS

Extension:      IhrisPractitionerCivilServiceId
Id:             ihris-personal-information-Civil-Service-Id
Title:          "iHRIS Personal Information Civil Service Id"
Description:    "iHRIS extension for civil service id."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "Civil Service Id"
* value[x] only string
* valueString 1..1 MS


Extension:      IhrisPractitionerLicenseId
Id:             ihris-personal-information-license-id
Title:          "iHRIS Personal Information license id"
Description:    "iHRIS extension for license id."
* ^context.type = #element
* ^context.expression = "Practitioner"
* valueString ^label = "License Id"
* value[x] only string
* valueString 1..1 MS