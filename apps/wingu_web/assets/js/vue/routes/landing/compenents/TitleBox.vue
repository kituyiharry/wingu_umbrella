<template>
  <v-layout class='px-2' row wrap d-flex align-center justify-content-center>
    <v-flex md6 >
      <h1 data-aos='fade' class='text-xs-center mx-5' style='font-size:3.56em;'> 
        Scale your business
      </h1>
      <h2 data-aos='fade' data-aos-delay='200' class='text-xs-center'>
        Read the words in reverse, <br/>over and over again
      </h2>
      <span data-aos='flip-left' data-aos-delay='250' 
        style='display:flex; align-items:center; justify-content: center'
        class='mt-5'>
        <v-btn color='deep-orange' round >
          <v-icon left>
            group_add
          </v-icon>
          <strong>
            get started
          </strong>
        </v-btn>
      </span>
      <span class='mt-4' style='display:flex; align-items:center; justify-content: center'>
        <v-tooltip bottom
            v-for='(icon,index) in ["mail", "gesture", "attachment", "cloud" ]' :key='icon'
          >
          <span style='font-family: Montserrat'>
            {{ icon }}
          </span>
          <v-icon slot='activator'
            data-aos='zoom-in' :data-aos-delay='(index+2)*200' class='mx-1' 
            >
            {{ icon }}
          </v-icon>
        </v-tooltip>
      </span>
    </v-flex>
    <v-flex md6>
      <v-card data-aos='fade-up' data-aos-duration='200' hover color='transparent' height='400' :width='$vuetify.breakpoint.lgAndUp ? "550" : "500"' 
        style='border-radius: 8px;'>
        <v-img height='400' src="/images/doc.jpg">
          <template v-slot:placeholder>
            <v-layout
              fill-height
              align-center
              justify-center
              ma-0
              >
              <v-progress-circular indeterminate color="grey lighten-5"></v-progress-circular>
            </v-layout>
          </template>
        </v-img> 
      </v-card>
    </v-flex>
  </v-layout>
</template>
<script charset="utf-8">
export default{
  name: 'TitleBox'
}
</script>
