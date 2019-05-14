<template> 
  <v-card style='border-radius: 8px;'>
    <v-divider v-if='$vuetify.breakpoint.smAndDown' />
    <v-card-title>
      <v-btn color='secondary' small icon round>
        <v-icon small>
          description
        </v-icon>
      </v-btn>
      <v-layout column>
        <span class='mytitle'> 
          <strong>Document Groups</strong>
        </span>
        <span style='font-size: 12px;'>
          {{ $store.state.store.documentClasses.length }} available
        </span>
      </v-layout>
    </v-card-title>
    <v-divider />
    <v-text-field
      append-icon="mic"
      class="mx-3 my-1"
      flat
      label="Search"
      prepend-inner-icon="search"
      hide-details
      solo-inverted
      ></v-text-field>
    <v-divider />
    <!--<v-card-text style='height: 213px;overflow-y: auto;'>-->
      <v-slide-y-reverse-transition hide-on-leave>
        <v-card-text 
          v-show='!showDocClassForm'
          :style='$vuetify.breakpoint.smAndDown 
          ? "height: 200px; overflow-y: auto;" : "max-height: 430px; overflow-y: auto;"'
          >
          <!--v-if="$store.state.store.documentClasses.length > 0" -->
          <v-layout 
            v-if="$apollo.queries.documentClasses.loading || $store.state.store.documentClasses.length>0" 
            row :wrap='!$vuetify.breakpoint.xsOnly'>
            <v-flex v-for='i in $store.state.store.documentClasses' 
              :key='i.id' px-1 :py-0='$vuetify.breakpoint.mdAndUp' xs12 sm4 md3 d-flex align-center justify-content-center>
              <DocCard :docclass='i' />
            </v-flex>
          </v-layout>
          <v-layout v-else column wrap align-center justify-content-center>
            <v-card flat width='300' height='150' 
              v-if='$store.state.store.documentClasses.length < 1'>
              <v-card-text class='mt-3 pa-4 text-xs-justify d-flex align-center justify-content-center'>
                <span>
                  There are no document classes available currently. Click 
                  <kbd style="cursor: pointer;background-color: purple;" @click='showDocClassForm=!showDocClassForm'>create</kbd> to save a new one 
                </span>
              </v-card-text>
            </v-card>
            <v-card v-else flat height='200'>
              <v-layout d-flex align-center justify-content-center 
                column fill-height>
                <v-progress-circular indeterminate color="orange"></v-progress-circular>
              </v-layout>
            </v-card>
          </v-layout>
        </v-card-text>
      </v-slide-y-reverse-transition>
      <v-divider />
      <v-slide-y-transition hide-on-leave>
        <v-card-text :class='$vuetify.breakpoint.smAndDown ? "pa-0" : ""' v-show='showDocClassForm'>
          <v-layout row wrap>
            <v-flex class='primary white--text' :style='$vuetify.breakpoint.mdAndUp ? "border-radius: 8px;" : ""' 
              xs12 sm6 pa-4 d-flex align-center justify-content-center>
              Material icons are delightful, beautifully crafted symbols for common actions and items. 
              Download on desktop to use them in your digital products for Android, iOS, and web.
            </v-flex>
            <v-flex xs12 sm6 :pa-2='$vuetify.breakpoint.smOnly || $vuetify.breakpoint.mdOnly' :pa-5='$vuetify.breakpoint.lgAndUp'>
              <v-card flat tile>
                <v-card-title>
                  <v-btn small icon round outline>
                    <v-icon small new>
                      add
                    </v-icon>
                  </v-btn>
                  <span style='font-size: 18px;'> 
                    <strong>New Group</strong>
                  </span>
                </v-card-title>
                <v-divider />
                <v-card-text>
                  <v-layout column>
                    <v-form>
                      <v-text-field box v-model='docName' name='' clearable label='Document Class' :counter='63' :max='63'  prepend-inner-icon='folder_shared'
                        hint='Collective name for this group of files'>
                      </v-text-field>
                      <v-text-field box v-model='docDesc' name='' clearable label='Description' :counter='280' :max='280' prepend-inner-icon='description'
                        hint='A short description of this group'>
                      </v-text-field>
                    </v-form>
                  </v-layout>
                </v-card-text>
              </v-card>
            </v-flex>
          </v-layout>
        </v-card-text>
      </v-slide-y-transition>
      <v-divider />
      <v-card-actions>
        <!--<v-spacer></v-spacer>-->
        <v-btn @click='showDocClassForm = !showDocClassForm' round outline small>
          new
        </v-btn>
        <v-spacer></v-spacer>
        <v-slide-x-reverse-transition>
          <div v-show='showDocClassForm'>
            <v-btn @click='showDocClassForm=false' small color='red lighten-2' round outline>
              discard
            </v-btn>
            <v-btn @click='createDocClass' small color='green' round outline>
              save
            </v-btn>
          </div>
        </v-slide-x-reverse-transition>
      </v-card-actions>
    </v-card>
  </template>
  <script charset="utf-8">
export default {
  name: "DocGroup",
  props: ['showDocClassForm'],
  data: ()=>({})
}
</script>
