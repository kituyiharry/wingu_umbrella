<template> 
  <v-container fluid>
    <v-layout fill-height row wrap>
      <v-flex data-aos='fade-up' :py-1='$vuetify.breakpoint.xsOnly' :pa-3='$vuetify.breakpoint.smAndUp' v-for='(n,i) in indexModel' :key='i' xs12 sm6 lg3>
        <Notifier @update='updateModel' :i='i' :model='n'/>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script charset="utf-8">
import Notifier from './components/ProfileNotifier.vue';
export default {
  name: "Index",
  components: { Notifier },
  data: ()=>({
    indexModel: [
      {icon: "supervisor_account", title: "Profile", description: "Review your profile settings", path: "/i/profile"},
      {icon: "assignment", title: "Records", description: "Search and Create records", path: "/i/profile"},
      {icon: "account_balance_wallet", title: "Finance", description: "Configure payment integrations", path: "/money/finance"},
      {icon: "event", title: "Events", description: "Manage upcoming events", path: "/i/profile"},
      {icon: "forum", title: "Forum", description: "Chat forum", path: "/i/profile"},
    ]
  }),
  methods: {
    updateModel(modelIndex){
      this.$emit("updateModel", modelIndex)
    }
  }
}
</script>
