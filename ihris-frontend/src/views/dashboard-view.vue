<template>
  <div class="dashboard-view">
      <Dashboard :dashboards="dashboards" ref="dashboard" ></Dashboard>
  </div>
</template>

<script>
// @ is an alias to /src
import Dashboard from '@/components/layout/dashboard.vue';

export default {
  name: "Dashboard-view",
  components: {
    Dashboard
  },
  created() {
    let dashboards = ["Dashboard"];
    dashboards.forEach((dashboard) => {
      this.addDashboard(dashboard);
    })
  },
  methods: {
    addDashboard(dashboard) {
      let dashboardObj = {};
      dashboardObj.id = "26885c60-aafd-11ea-926e-49e171c7b512";
      dashboardObj.title = dashboard;
      dashboardObj.iframeLink = this.getKibanaLink() + "/app/kibana#/dashboard/" + dashboardObj.id + "?embed=true";

      this.dashboards.push(dashboardObj);
    },
    getKibanaLink() {
        let kibanaLink = "http://localhost:5601";
        return kibanaLink;
    }
  },
  data() {
      return {
        dashboards: []
      }
  }
};
</script>
