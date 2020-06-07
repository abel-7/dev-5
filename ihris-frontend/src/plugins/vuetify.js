import Vue from "vue";
import Vuetify from "vuetify/lib";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    options: {
      customProperties: true
    },
    themes: {
      light: {
        primary: {
          base: "#569fd3",
          darken1: "0d3552",
          lighten1: "ddecf6"
        },
        secondary: {
          base: "#5f6062",
          darken1: "04070e",
          lighten1: "e5e5e5"
        },
        accent: "#78496a",
        error: "#b32317",
        info: "#005595",
        success: "#8a8d35",
        warning: "#d06f1a"
      }
    }
  }
});