<template>
  <fhir-template>
    Loading...
  </fhir-template>
</template>

<script>
// @ is an alias to /src

const comps = { 
  "ihris-resource": () => import(/* webpackChunkName: "fhir-main" */ "@/components/ihris/ihris-resource" ),
  "ihris-section": () => import(/* webpackChunkName: "fhir-main" */ "@/components/ihris/ihris-section" ),
  "ihris-secondary": () => import(/* webpackChunkName: "fhir-main" */ "@/components/ihris/ihris-secondary" ),
  "ihris-array": () => import(/* webpackChunkName: "fhir-main" */ "@/components/ihris/ihris-array" ),
  "fhir-extension": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-extension" ),
  "fhir-reference": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-reference" ),
  "fhir-string": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-string" ),
  "fhir-human-name": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-human-name" ),
  "fhir-code": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-code" ),
  "fhir-date": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-date" ),
  "fhir-date-time": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-date-time" ),
  "fhir-period": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-period" ),
  "fhir-identifier": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-identifier" ),
  "fhir-contact-point": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-contact-point" ),
  "fhir-address": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-address" ),
  "fhir-codeable-concept": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-codeable-concept" ),
  "fhir-uri": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-uri" ),
  "fhir-boolean": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-boolean" ),
  "fhir-positive-int": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-positive-int" ),
  "fhir-coding": () => import(/* webpackChunkName: "fhir-main" */ "@/components/fhir/fhir-coding" )
}
var page

export default {
  name: "fhir-page",
  data: function() {
    return {
    }
  },
  components: {
    FhirTemplate: function() {
      return new Promise(resolve => {
        fetch( "/config/page/"+page ).then(response => {
            response.json().then(data => {
              resolve( {
                name: 'fhir-template', 
                data: function() { return { isEdit: true, fhirId: undefined } }, 
                components: comps, 
                template: data.template
              } )
            }).catch(err => {
              console.log(err)
              resolve({template: '<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>'})
            })
        }).catch(err => {
          console.log(err)
          resolve({template: '<div><h1>Error</h1><p>An error occurred trying to load this page</p>.</div>'})
        })
      })
    }
  },
  created: function() {
    page = this.$route.params.page
  }
}

</script>
