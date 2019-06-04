<!--Entry module for the entire application-->
<template style='font-family: "Montserrat", sans-serif;'>
  <!--<transition name="slide-fade">-->
    <router-view></router-view>
  <!--</transition>-->
</template>
<script charset="utf-8">
export default{
  name: 'App',
  data: () => ({
  })
}
</script>
<style type="text/css" media="screen">
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700|Raleway:500,600|Pacifico&display=swap');
html {
  scroll-behavior: smooth;
}
.slide-fade-enter-active {
  transition: all .2s ease;
}
.slide-fade-leave-active {
  transition: all .2s; /*cubic-bezier(1.0, 0.5, 0.8, 1.0);*/
}
/*.slide-fade-enter,*/ .slide-fade-leave-to
/* .slide-fade-leave-active below version 2.1.8 */ {
transform: translateX(10px);
opacity: 0;
}
.slide-fade-enter
/* .slide-fade-leave-active below version 2.1.8 */ {
transform: translateX(-10px);
opacity: 0;
}

.fade-enter-active,
.fade-leave-active {
  transition-duration: 0.2s;
  transition-property: opacity;
  transition-timing-function: ease;
}

.fade-enter,
.fade-leave-active {
  opacity: 0
}

.slide-left-enter-active,
.slide-left-leave-active,
.slide-right-enter-active,
.slide-right-leave-active {
  transition-duration: 0.2s;
  transition-property: height, opacity, transform;
  transition-timing-function: cubic-bezier(0.55, 0, 0.1, 1);
  overflow: hidden;
}

.slide-left-enter,
.slide-right-leave-active {
  opacity: 0;
  transform: translate(2em, 0);
}

.slide-left-leave-active,
.slide-right-enter {
  opacity: 0;
  transform: translate(-2em, 0);
}
/*.v-card__text{
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
}*/
</style>
