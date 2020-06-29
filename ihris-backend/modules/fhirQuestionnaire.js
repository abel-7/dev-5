const nconf = require('./config')
const fhirAxios = nconf.fhirAxios
const structureDef = require('./fhirStructureDefinition')
const { v5: uuidv5 } = require('uuid')


const fhirQuestionnaire = {
  setQuestionnairePaths: (response) => {
    let replaceList = []
    let pathSeen = {}
    let autoReplace = []
    let currReplaceIdx = {}
    let origReplaceIdx = {}

    const processChildren = (items) => {
      for( let item of items ) {

        let path = item.linkId
        for( let replace of autoReplace ) {
          path = path.replace( replace[0], replace[1] )
        }

        if ( item.hasOwnProperty("item") ) {
          // is a group

          let origPath = path
          let thisIdx
          if ( path.match( /\[\d+\]$/ ) ) {
            path = path.replace( /\[\d+\]$/, n => { thisIdx = n.slice(1, -1); return "[X]" } )
            currReplaceIdx[path] = path.replace( /\[X\]$/, "[" + thisIdx + "]" )
            origReplaceIdx[path] = currReplaceIdx[path]
            autoReplace.push( [origPath, path] )
            // Doesn't matter if it's been seen when we're resetting the replace value
            for( let remove of Object.keys(pathSeen).filter( rem => rem.startsWith(path) ) ) {
              pathSeen[remove] = false
            }

          }
          if ( path !== replaceList[0] ) {
            replaceList.unshift(path)
          }
          item.definition = path
          processChildren( item.item )

        } else {
          // is an answer
          while( !path.startsWith( replaceList[0] ) ) {
            let ended = replaceList.shift()
            for( let remove of Object.keys(pathSeen).filter( rem => rem.startsWith(ended) ) ) {
              pathSeen[remove] = false
            }
            for(let replace of Object.keys(currReplaceIdx).filter(repPath => repPath.startsWith(ended))) {
              currReplaceIdx[replace] = origReplaceIdx[replace]
            }
            if ( replaceList.length === 0 ) break
          }
          if ( replaceList.length === 0 ) break

          let replaceStr = replaceList[0]
          if ( pathSeen[path] ) {
            currReplaceIdx[ replaceList[0] ] = currReplaceIdx[ replaceList[0] ].slice(0, -1).replace( /\d+$/, n => ++n + "]" )
            if ( path !== replaceList[0] ) {
              for( let remove of Object.keys(pathSeen).filter( rem => rem.startsWith(replaceList[0]) ) ) {
                pathSeen[remove] = false
              }
            }
          }
          pathSeen[path] = true

          /*
          if ( currReplaceIdx[ replaceList[0] ] ) {
            path = path.replace( replaceList[0], currReplaceIdx[ replaceList[0] ] )
          }
          */
          for( let idx in replaceList ) {
            if ( currReplaceIdx[ replaceList[idx] ] ) {
              path = path.replace( replaceList[idx], currReplaceIdx[ replaceList[idx] ] )
            }
          }
          item.definition = path

        }
      }
    }

    processChildren( response.item )

  },
  _createBundle: ( fields, questionnaireRef ) => {
    const FHIR_UUID_NAMESPACE = nconf.get("fhir:uuid:namespace") || "e91c9519-eccb-48a8-a506-6659b8c22518"
    let entries = {}
    let idCount = 1
    for( let field of fields ) {
      let paths = field.definition.split('.')
      let entry
      let current
      let arrayIdx = false
      let lastElement = paths.pop()
      for( let element of paths ) {
        if ( !entry ) {
          if ( entries.hasOwnProperty( element ) ) {
            entry = entries[element]
          } else {
            let itemDef = questionnaireRef[ element ]
            let profile = itemDef.definition
            let resourceType = element
            if ( element.endsWith(']') ) {
              resourceType = element.replace( /\[\d+\]$/, n => (arrayIdx = n.slice(1, -1)) && "" )
            } else {
              arrayIdx = false
            }
            entry = {
              fullUrl: "urn:uuid:" + uuidv5( "TEMP"+idCount++, FHIR_UUID_NAMESPACE ),
              resource: {
                resourceType: resourceType,
                meta: {
                  profile: [ profile ]
                }
              },
              request: {
                method: "POST",
                url: resourceType
              }
            }
            entries[element] = entry
          }
          current = entry.resource
        } else {
          if ( element.endsWith(']') ) {
            element = element.replace( /\[\d+\]$/, n => (arrayIdx = n.slice(1, -1)) && "" )
          } else {
            arrayIdx = false
          }
          if ( !current.hasOwnProperty( element ) ) {
            if ( arrayIdx !== false ) {
              current[element] = []
              current[element][arrayIdx] = {}
              current = current[element][arrayIdx]
            } else {
              current[element] = {}
              current = current[element]
            }
          } else {
            if ( arrayIdx !== false ) {
              if ( !current[element][arrayIdx] ) {
                current[element][arrayIdx] = {}
              }
              current = current[element][arrayIdx]
            } else {
              current = current[element]
            }
          }
        }
      }
      if ( lastElement.endsWith(']') ) {
        lastElement = lastElement.replace( /\[\d+\]$/, n => (arrayIdx = n.slice(1, -1)) && "" )
      } else {
        arrayIdx = false
      }
      if ( typeof field.answer === 'string' && field.answer.startsWith("__REPLACE__") ) {
        let reference = field.answer.substring(11)
        if ( entries.hasOwnProperty(reference) ) {
          current[lastElement] = { reference: entries[reference].fullUrl }
        }
      } else {
        if ( !current.hasOwnProperty( lastElement ) ) {
          if ( arrayIdx !== false ) {
            if ( Array.isArray( field.answer ) ) {
              current[lastElement] = field.answer
            } else {
              current[lastElement] = []
              current[lastElement][arrayIdx] = field.answer
            }
          } else {
            current[lastElement] = field.answer
          }
        } else {
          if ( arrayIdx !== false ) {
            if ( Array.isArray( field.answer ) ) {
              if ( Array.isArray( current[lastElement] ) && current[lastElement].length > 0 ) {
                current[lastElement] = current[lastElement].concat( field.answer )
              } else {
                current[lastElement] = field.answer
              }
            } else {
              current[lastElement][arrayIdx] = field.answer
            }
          } else {
            current[lastElement] = field.answer
          }
        }
      }
    }
    let bundleEntries = []
    for( let entry of Object.keys(entries) ) {
      bundleEntries.push( entries[entry] )
    }
    return {
      resourceType: "Bundle",
      type: "transaction",
      entry: bundleEntries
    }
  },
  processQuestionnaire: (response) => {
    return new Promise( (resolve,reject) => {

      fhirQuestionnaire.setQuestionnairePaths(response)

      let qId = response.questionnaire.substring( response.questionnaire.lastIndexOf('/')+1 )
      fhirAxios.read("Questionnaire", qId).then( async (questionnaire) => {

        let questionnaireRef = {}
        const flattenItems = ( items, questionnaireRef ) => {
          for( let item of items ) {
            questionnaireRef[ item.linkId ] = item
            if ( item.item ) {
              flattenItems( item.item, questionnaireRef )
            }
          }
        }
        flattenItems( questionnaire.item, questionnaireRef )

        let fields = []
        const capitalize = (str) => {
          return str[0].toUpperCase() + str.slice(1)
        }

        const processItems = (items) => {
          return new Promise( async (resolve,reject) => {
            for( let item of items ) {
              if ( item.item ) {
                try {
                  await processItems( item.item )
                } catch( err ) {
                  reject( err )
                }
              } else {
                let question = questionnaireRef[item.linkId]


                let simple = [ "date", "string" ]
                let data = { linkId: item.linkId, definition: item.definition, q: question.type }
                if ( simple.includes( question.type ) ) {
                  if ( question.repeats ) {
                    data.answer = item.answer.map( answer => answer["value"+capitalize(question.type)] )
                  } else {
                    data.answer = item.answer[0]["value"+capitalize(question.type)]
                  }
                  fields.push(data)
                } else if ( question.type === "choice" ) {
                  try {
                    let field = await structureDef.getFieldDefinition( question.definition )
                    //fields[item.linkId] = { answer: item.answer, field: field.type[0] }
                    //let data = { answer: item.answer, field: field.type[0], q: question.type }
                    if ( field.type[0].code === "code" ) {
                      if ( question.repeats ) {
                        data.answer = item.answer.map( answer => answer.valueCoding.code )
                      } else {
                        data.answer = item.answer[0].valueCoding.code
                      }
                    } else if ( field.type[0].code === "CodeableConcept" ) {
                      if ( question.repeats ) {
                        data.answer = item.answer.map( answer => { return { coding: [ answer.valueCoding ], text: answer.valueCoding.display } } )
                      } else {
                        data.answer = { coding: [ item.answer[0].valueCoding ], text: item.answer[0].valueCoding.display }
                      }
                    } else {
                      data.field = field.type[0]
                      data.answer = item.answer 
                    }

                    fields.push(data)
                  } catch( err ) {
                    reject( err )
                  }
                } else if ( question.type === "reference" ) {
                  //Need to update this when references are fully handled
                  console.log("WARNING: References need to be finished in fhirQuestionnaire.js")
                  data.field = "Reference"
                  if ( question.repeats ) {
                    data.answer = item.answer.map( answer => { return { reference: answer } } )
                  } else {
                    data.answer = { reference: item.answer }
                  }
                } else {
                  console.log("ERROR: questionnaire doesn't handle questions of type "+question.type+" yet")
                }

              }
            }
            resolve()
          } )
        }

        await processItems( response.item )
        //console.log("FINISHED",JSON.stringify(fields,null,2))
        //console.log(fields)
        let bundle = fhirQuestionnaire._createBundle( fields, questionnaireRef )
        resolve(bundle)

      } ).catch( (err) => {
        reject( err )
      } )
    } )

  }
}

module.exports = fhirQuestionnaire
