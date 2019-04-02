<template>
  <v-card @click='selectedCard=true' style='border-radius: 8px;' hover
    :class='$vuetify.breakpoint.smAndDown? "mr-1 my-1" : "my-1"' 
    height='150' dark :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
    <v-card-title class='pa-2'>
      <v-btn small icon>
        <v-icon small>
          description
        </v-icon>
      </v-btn>
      <span style='font-size: 16px;'>
        <strong>{{ form.name }}</strong>
      </span>
    </v-card-title>
    <v-divider />
    <v-divider />
    <v-card-text>
      {{ form.summary }}
    </v-card-text>
  </v-card>
</template>
<script charset="utf-8">
export default {
  name: "FormCard",
  props: ['form'],
  data: () => ({
  })
}
</script>
<style scoped type="text/css" media="screen">
.v-card--hover{
  border-radius: 8px;
  background-color: #61045fff;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
}
.v-card--hover:hover{
  background-color: #aa076bff;
  transform: translateY(-7.5px);
}
</style>
