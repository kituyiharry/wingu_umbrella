<template>
  <v-container 
    fluid :class='$vuetify.breakpoint.smAndDown ? 
    "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout row wrap fill-height>
      <v-flex xs12>
        <v-card color='primary'>
          <v-card-title class='white--text'>
            <span style='font-size: 32px;'>Records</span>
          </v-card-title>
          <v-card-actions pr-2>
            <v-spacer></v-spacer>
            <v-select
              class='ma-2'
              style='max-width: 250px;' v-model='docGroup'
              :items="$store.state.store.documentClasses"
              item-text='classname' return-object
              solo chips hide-details round 
              label="Collection Name" :hint='docGroup!=null ? docGroup.classDescription : "No Group selected"'
              ></v-select>
            <v-select
              class='ma-2'
              style='max-width: 200px;'
              :items="items"
              box chips hide-details round 
              label="Box style"
              ></v-select>
          </v-card-actions>
          <v-divider />
          <v-card-text>
            <v-layout row wrap>
              <v-flex xs12 sm md>

              </v-flex>
            </v-layout>
          </v-card-text>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script charset="utf-8">
export default {
name: "Records",
data: () => ({
items: [
"Group 1",
"Group 2"
],
docGroup: null,
})
}
</script>
