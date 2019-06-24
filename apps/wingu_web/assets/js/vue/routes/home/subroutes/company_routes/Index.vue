<template> 
  <v-container fill-height class='pa-3'
    style="background: linear-gradient(to bottom, #996FD6, #FFFFFF)"
    fluid>
    <v-layout fill-height row wrap class='pb-1'>
      <!--<v-flex xs12>-->
        <!--<v-subheader>-->
          <!--Hoes mad!-->
          <!--</v-subheader>-->
        <!--</v-flex>-->
      <v-flex 
        :py-1='$vuetify.breakpoint.xsOnly' 
        :py-2='$vuetify.breakpoint.smAndUp' px-2
        v-for='(n,i) in indexModel' 
        :key='i' xs12 sm6 md4 lg3>
        <div :data-aos='$vuetify.breakpoint.smAndDown ? "fade" : "fade-right"' :data-aos-delay='i*50'>
          <Notifier @update='updateModel' :i='i' :model='n'/>
        </div>
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
