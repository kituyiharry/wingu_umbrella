<template>
  <v-card hover @click='$router.push(`/b/${company.id}`)'
    v-ripple class='' style='border-radius: 8px;'>
    <v-layout column align-center pa-2>
      <v-avatar data-aos='zoom-in' data-aos-anchor='#stations' 
        data-aos-anchor-placement='bottom-bottom' :data-aos-delay='(i+1)*100'>
        <v-img src='/images/sahihi.png' alt=''>
          <template v-slot:placeholder>
            <v-layout
              fill-height
              align-center
              justify-center
              ma-0>
              <v-progress-circular indeterminate color="orange"></v-progress-circular>
            </v-layout>
          </template>
        </v-img>
      </v-avatar>
      <!--<span class='text-xs-center' data-aos='fade' data-aos-anchor='#stations' data-aos-anchor-placement='center-bottom' :data-aos-delay='i*50'>-->
        <v-chip flat small label color='primary lighten-1' class='white--text'>
          <v-avatar tile class="deep-orange">
            <strong>
              {{ company.name | first }}
            </strong> 
          </v-avatar>
          {{ company.name }}
        </v-chip>
      </v-layout>
    </v-card>
  </template>
  <script charset="utf-8">
export default {
  name: "CompanyElement",
  props: ['company'],
  data: () => ({
  }),
  filters: {
    first(letter){
      let fl = letter.split(" ")
      return(fl[0].slice(0,1))
    }
  }
}
</script>
<style scoped type="text/css" media="screen">
.v-card--hover{
  border-radius: 8px;
  background-image: linear-gradient(to bottom, #AA076BFF, #61045F00);
  background-color: #61045fff;
}
.v-card--hover:hover{
  background-color: #aa076bff;
  transform: translateY(-7.5px);
}

</style>
