<template>
  <v-card flat :color='(dragIndex===index) ? "primary lighten-2" : ""' 
    style='border: 2.0px solid #b589f3;border-radius: 4px;'>
    <v-card-title class='py-1'>
      <v-btn id='handle' small icon style='font-size: 9px;' 
        class='black--text mr-2' size='20' 
        color='secondary lighten-3'>
        <v-icon small color='primary darken-1'>
          {{ section.icon }}
        </v-icon>
        <!--{{ i }}-->
      </v-btn>
      <strong style="font-size: 16px;"> Node</strong>
    </v-card-title>
    <v-divider />
    <v-card-text style='font-size: 12px;' class='px-4'>
      {{ section.data }}
    </v-card-text>
  </v-card>
</template>
<script charset="utf-8">
export default {
  name: "NodeWrapper",
  props: ['index', 'section', 'drag', 'dragIndex'],
  data: () => ({
  }),
  methods: {
    log(e){
      console.log(e)
    }
  }
}
</script>
