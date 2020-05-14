'use strict'

jest.mock('fs')

describe( 'converts a FHIR Parameters resource into configuration data', () => {
  const FILE_OUTPUT = {
    "fhir": { "base": "http://localhost:8080/hapi/fhir/" }, 
    "keys": { "ihris": "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdeFrJr76IQ+SYAoAIw8crZKNW\nir2re7Z7Iu+XzeYYop5+36Ux6uEQKSXo7s1xY2ou9nCkVAddZ1qehBo0e2MCtk62\nmQJbBT18fiZ3veQPvb0LC/9aFl64RuOguPrCZC+sbZLegQ6Wwf96UWyqmR49gaHO\nEdXwdFdSVyBGyS7dmwIDAQAB\n-----END PUBLIC KEY-----" }
  }
  const REMOTE_OUTPUT = {
    "site": { "title": "iHRIS", "logo": "ihris-logo.png" }
  }
  const MOCK_OBJ = {
    "resourceType": "Parameters",
    "id": "base-config",
    "meta": {
      "profile": [
        "http://ihris.org/fhir/StructureDefinition/ihris-parameters-local-config"
      ]
    },
    "parameter": [
      {
        "name": "fhir:base",
        "valueString": "http://localhost:8080/hapi/fhir/"
      },
      {
        "name": "keys",
        "part": [
          {
            "name": "ihris",
            "valueString": "-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDdeFrJr76IQ+SYAoAIw8crZKNW\nir2re7Z7Iu+XzeYYop5+36Ux6uEQKSXo7s1xY2ou9nCkVAddZ1qehBo0e2MCtk62\nmQJbBT18fiZ3veQPvb0LC/9aFl64RuOguPrCZC+sbZLegQ6Wwf96UWyqmR49gaHO\nEdXwdFdSVyBGyS7dmwIDAQAB\n-----END PUBLIC KEY-----"
          }
        ]
      }
    ]
  }
  const MOCK_FILE_DATA = JSON.stringify( MOCK_OBJ )
  const MOCK_KEYS = [ MOCK_OBJ.parameter[1].part[0].valueString ]
  const MOCK_REMOTE_OBJ = {
    "resourceType": "Parameters",
    "id": "ihris-config",
    "meta": {
      "profile": [
        "http://ihris.org/fhir/StructureDefinition/ihris-parameters-remote-config"
      ]
    },
    "parameter": [
      {
        "name": "signature",
        "valueSignature": {
          "type": [
            {
              "code": "1.2.840.10065.1.12.1.14",
              "system": "urn:iso-astm:E1762-95:2013"
            }
          ],
          "data": "aTfS/8J0hl6k75tR5NawJgXZtDFACvNEolmriRmHrf6uu2EnrMfqXwzveZOQ1yrZ3Sf6cCLqIaYKsZKIfn+GLX0rVFsBBj4jLppQizZ5v/nPSh4s1opKTiFchrvN+rEGDAN5nFT3JselHgruXu/zBPNYnDbCub1x88zw5IxHAaY=",
          "when": "2020-05-13T00:00:00Z",
          "who": {
            "reference": "http://ihris.org/fhir/Organization/ihris"
          }
        }
      },
      {
        "name": "config",
        "part": [
          {
            "name": "site:title",
            "valueString": "iHRIS"
          },
          {
            "name": "site:logo",
            "valueString": "ihris-logo.png"
          }
        ]
      }
    ]
  }



  test( 'parses a FHIR Parameters resource from a file', () => {
    require('fs').__setMockFile( MOCK_FILE_DATA )
    const fhirConfig = require('../modules/fhirConfig')
    const config = fhirConfig.parseFile( 'baseConfig.js' )

    expect( config ).toEqual( FILE_OUTPUT )
  } )

  test( 'parses a FHIR Parameters resource from a remote source', () => {
    const fhirConfig = require('../modules/fhirConfig')
    const config = fhirConfig.parseRemote( MOCK_REMOTE_OBJ, MOCK_KEYS )

    expect( config ).toEqual( REMOTE_OUTPUT )
  } )

} )