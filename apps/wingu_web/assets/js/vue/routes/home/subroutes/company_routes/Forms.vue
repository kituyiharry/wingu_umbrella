<template>
  <v-container fluid :class='$vuetify.breakpoint.smAndDown ? "mygradient pa-0 mt-5" :  "mygradient mt-5" '>
    <v-layout data-aos='fade-up' row wrap>
      <v-flex xs12>
        <!--<v-card :class='$vuetify.breakpoint.smAndDown ? "white--text" : ""' :color='$vuetify.breakpoint.smAndDown ? "primary" : ""'>-->
        <v-card dark class='white--text' color="primary">
          <v-card-title style='font-size: 24px;'>
            <v-btn small icon outline round>
              <v-icon small>
                description
              </v-icon>
            </v-btn>
            <v-layout column>
              <span class='mytitle'>
                <strong>Personal Documents</strong>
              </span>
                <span class='my_sub_header'>12 Documents</span>
            </v-layout>
          </v-card-title>
        </v-card>
      </v-flex>
      <v-flex xs12>
        <v-card>
          <v-card-title>
            <v-slide-x-transition>
              <span class='ml-1' v-show='createCard' style='font-size: 18px;' >
                <strong>
                  Add new Form
                </strong>
              </span>
            </v-slide-x-transition>
            <v-spacer></v-spacer>
            <v-btn small :color='createCard ? "red lighten-2" : "secondary"' @click='createCard=!createCard' round outline>
              {{ createCard ? "close" : "create" }}
              <v-icon right small>
                {{ createCard ? "close" : "create" }}
              </v-icon>
            </v-btn>
          </v-card-title>
          <v-divider />
          <v-slide-y-transition hide-on-leave>
            <v-card-text v-show='createCard'>
              <!--<v-container grid-list-md>-->
                <v-layout wrap>
                  <v-flex xs12 sm6 md4>
                    <v-text-field box label="Legal first name*" required></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field box label="Legal middle name" hint="example of helper text only on focus"></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6 md4>
                    <v-text-field
                      box
                      label="Legal last name*"
                      hint="example of persistent helper text"
                      persistent-hint
                      required
                      ></v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-text-field box label="Email*" required></v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-text-field box label="Password*" type="password" required></v-text-field>
                  </v-flex>
                  <v-flex xs12 sm6>
                    <v-select
                      box
                      :items="['0-17', '18-29', '30-54', '54+']"
                      label="Age*"
                      required
                      ></v-select>
                  </v-flex>
                  <v-flex xs12 sm6>
                    <v-autocomplete
                      box
                      :items="['Skiing', 'Ice hockey', 'Soccer', 'Basketball', 'Hockey', 'Reading', 'Writing', 'Coding', 'Basejump']"
                      label="Interests"
                      multiple
                      ></v-autocomplete>
                  </v-flex>
                </v-layout>
              <!--</v-container>-->
              <small>*indicates required field</small>
            </v-card-text>
          </v-slide-y-transition>
          <v-divider />
        </v-card>
      </v-flex>
      <v-flex xs12 sm6 md7>
        <v-card :flat='$vuetify.breakpoint.xsOnly'>
          <v-card-title>
            <v-btn icon small outline>
              <v-icon small>
                folder_shared
              </v-icon>
            </v-btn>
            <v-layout column >
              <span class='mytitle'> 
                <strong>Your Forms</strong>
              </span>
              <span class='my_sub_header'>10 Document classes</span>
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
          <v-card-text 
            :style='$vuetify.breakpoint.smAndDown 
            ? "height: 200px; overflow-y: auto;" : "max-height: 300px; overflow-y: auto;"'
            >
            <v-layout row :wrap='!$vuetify.breakpoint.xsOnly'>
              <v-flex v-for='i in 8' :key='i' :pa-1='$vuetify.breakpoint.mdAndUp' xs12 sm6 md4 d-flex align-center justify-content-center>
                <v-card @click='selectedCard=true' style='border-radius: 8px;' hover
                  :class='$vuetify.breakpoint.smAndDown? "mr-1 my-1" : "my-1"' 
                  color='primary' height='150' :width='$vuetify.breakpoint.xsOnly ? 250 : ""'>
                </v-card>
              </v-flex>
            </v-layout>
          </v-card-text>
          <v-divider />
        </v-card>
      </v-flex>
      <v-flex xs12 sm6 md5>
        <v-card>
          <v-card-title>
            <v-btn icon outline round small>
              <v-icon small>
                view_compact
              </v-icon>
            </v-btn>
            <span class='mytitle'>
              <strong>Preview</strong>
            </span>
          </v-card-title>
          <v-divider />
          <v-card-text :style='$vuetify.breakpoint.mdAndUp ? "height:358px;" :  "height:200px;"'>
          </v-card-text>
        </v-card>
      </v-flex>
      <v-flex xs12>
        <v-card >
          <v-card-actions>
            <v-btn flat small outline round>
              Switch
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-flex>
    </v-layout>
  </v-container>
</template>
<script charset="utf-8">
export default {
  name: "Forms",
  data: () => ({
    selectedCard: true,
    createCard: false
  })
}
</script>
<style type="text/css" media="screen">
.my_sub_header{
  font-size: 12px;
}
</style>
