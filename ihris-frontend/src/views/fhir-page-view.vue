<template>
  <ihris-template>
    Loading...
  </ihris-template>
</template>

<script>
// @ is an alias to /src

var pageId
var page

export default {
  name: "fhir-page",
  data: function() {
    return {
    }
  },
  components: {
    IhrisTemplate: function() {
      return new Promise(resolve => {
        fetch( "/config/page/"+page ).then(response => {
            response.json().then(data => {
              resolve( {
                name: 'ihris-template', 
                data: function() { 
                  return { 
                    fhirId: pageId, 
                    isEdit: false 
                  } 
                }, 
                components: { 
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
                },
                template: data.template,
                methods: {
                  setEdit: function(val) {
                    this.isEdit = val
                  }
                }
              } )
              //console.log(data.template)
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
  beforeCreate: function() {
    pageId = this.$route.params.id 
    page = this.$route.params.page
  }
}

</script>
