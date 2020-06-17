<template>
    <div class="dashboard">
        <v-card v-for="dashboard in dashboards" v-bind:key="dashboard.id" class="mb-5">
            <v-card-title>{{dashboard.title}}</v-card-title>
            <v-card-text>
                <iframe :src="dashboard.iframeLink" height="800" width="100%"></iframe>
            </v-card-text>
        </v-card>
    </div>
</template>

<script>
export default {
    name: "Dashboard",
    props: ["dashboards"]
}
</script>