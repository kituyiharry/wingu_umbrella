<!--Entry module for the entire application-->
<template style='font-family: "Montserrat", sans-serif;'>
  <router-view></router-view>
</template>
<script charset="utf-8">
export default{
  name: 'App',
  data: () => ({
  })
}
</script>
<style type="text/css" media="screen">
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:500,600');
html {
  scroll-behavior: smooth;
}
.v-card__text{
    -webkit-hyphens: auto;
    -webkit-hyphenate-limit-before: 3;
    -webkit-hyphenate-limit-after: 3;
    -webkit-hyphenate-limit-chars: 6 3 3;
    -webkit-hyphenate-limit-lines: 2;
    -webkit-hyphenate-limit-last: always;   
    -webkit-hyphenate-limit-zone: 8%;

    -moz-hyphens: auto;
    -moz-hyphenate-limit-chars: 6 3 3;
    -moz-hyphenate-limit-lines: 2;  
    -moz-hyphenate-limit-last: always;
    -moz-hyphenate-limit-zone: 8%;

    -ms-hyphens: auto;
    -ms-hyphenate-limit-chars: 6 3 3;
    -ms-hyphenate-limit-lines: 2;
    -ms-hyphenate-limit-last: always;   
    -ms-hyphenate-limit-zone: 8%;

    hyphens: auto;
    hyphenate-limit-chars: 6 3 3;
    hyphenate-limit-lines: 2;
    hyphenate-limit-last: always;   
    hyphenate-limit-zone: 8%;
}
</style>
