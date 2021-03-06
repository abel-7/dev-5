const fs = require('fs')
const crypto = require('crypto')

// Don't allow any settings to these values from a remote config
const invalidRemoteKeys = [ 'fhir', 'config', 'session', 'keys' ]

const fhirConfig = {
  parseFile: ( file ) => {
    let configString = fs.readFileSync( file )
    let config = JSON.parse( configString )

    let defaults = {}
    if ( config.meta && config.meta.profile 
      && config.meta.profile.includes( "http://ihris.org/fhir/StructureDefinition/ihris-parameters-local-config" ) ) {
      for ( let param of config.parameter ) {
        if( param.hasOwnProperty("valueString") ) {
          let split = param.name.split(':')
          let last = split.pop()
          let assign = defaults
          for( let level of split ) {
            if ( !assign.hasOwnProperty( level ) ) {
              assign[level] = {}
            }
            assign = assign[level]
          }
          assign[last] = param.valueString
        } else if ( param.hasOwnProperty("part") ) {
          if ( !defaults.hasOwnProperty( param.name ) ) {
            defaults[param.name] = {}
          }
          for ( let part of param.part ) {
            if( part.hasOwnProperty("valueString") ) {
              defaults[param.name][part.name] = part.valueString
            }
          }
        }
      }
    } else {
      console.log( "Invalid profile for configuration file: " + file )
    }
    return defaults
  },
  parseRemote: ( config, keys ) => {

    let defaults = {}
    if ( config.meta && config.meta.profile 
      && config.meta.profile.includes( "http://ihris.org/fhir/StructureDefinition/ihris-parameters-remote-config" ) ) {

      let sig = config.parameter.find( param => param.name === "signature" )
      let addconf = config.parameter.find( param => param.name === "config" )

      let verifier = crypto.createVerify( 'sha256' )
      verifier.update( JSON.stringify( addconf.part ) )

      let configAccepted = false
      for( let key of keys ) {
        if ( verifier.verify( key, sig.valueSignature.data, 'base64' ) ) {
          configAccepted = true
          break
        }
      }

      if ( configAccepted ) {
        for ( let param of addconf.part) {
          if( param.hasOwnProperty("valueString") ) {
            let split = param.name.split(':')
            if ( invalidRemoteKeys.includes( split[0] ) ) {
              console.log("Can't override "+split[0]+" from remote config file.")
              continue
            }
            let last = split.pop()
            let assign = defaults
            for( let level of split ) {
              if ( !assign.hasOwnProperty( level ) ) {
                assign[level] = {}
              }
              assign = assign[level]
            }
            assign[last] = param.valueString
          }
        }
      } else {
        console.log( "No valid key set for configuration Parameters " + config.id )
      }
    } else {
      console.log( "Invalid profile for remote configuration parameters for " + config.id )
    }

    return defaults
  },

  parseStructureDefinition: ( resource ) => {
    if ( !resource.hasOwnProperty("snapshot") ) {
      return false
    }
    let structure = {}
    const ms = resource.snapshot.element.filter( ele => ele.mustSupport )
    for( let ele of ms ) {
      let levels = ele.id.split('.')

      let piece = structure
      for( let idx in levels ) {
        let field = levels[idx]
        if ( !piece.hasOwnProperty(field) ) {
          piece[field] = {}
        }
        if ( idx < levels.length - 1 ) {
          if ( !piece[field].hasOwnProperty("fields") ) {
            piece[field].fields = {}
          }
          piece = piece[field].fields
        } else {
          piece = piece[field]
          piece.field = field
        }
      }

      const copies = ["id", "path", "label", "sliceName", "min", "max" ]
      for( let copy of copies ) {
        if ( ele.hasOwnProperty(copy) ) {
          piece[copy] = ele[copy]
        } else if ( ele.base.hasOwnProperty(copy) ) {
          piece[copy] = ele.base[copy]
        }
      }
      for ( let copy of [ "min", "max" ] ) {
        if ( ele.base.hasOwnProperty(copy) ) {
          piece["base-"+copy] = ele.base[copy]
        }
      }

      const types = ["code", "profile", "targetProfile"]
      for( let type of types ) {
        if ( ele.type[0].hasOwnProperty(type) ) {
          piece[type] = ele.type[0][type]
        }
      }

      if ( ele.hasOwnProperty("binding") && ele.binding.hasOwnProperty("valueSet") ) {
        piece.binding = ele.binding.valueSet
      }
    }
    return structure

  }
}

module.exports = fhirConfig
