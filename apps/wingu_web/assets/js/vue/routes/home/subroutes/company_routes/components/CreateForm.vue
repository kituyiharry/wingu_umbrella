<template>
  <v-card dark flat tile>
    <v-card-text class='pa-0'>
      <v-layout row wrap>
        <v-flex class='primary pa-3' xs12 md4>
          <v-layout row>
            <!--<v-flex xs2>-->
              <v-btn icon outline small>
                <v-icon small>
                  add
                </v-icon>
              </v-btn>
            <!--</v-flex>-->
            <v-flex xs10>
              <v-layout column>
                <v-flex>
                  <span style='font-size: 18px;'>
                    <strong>Build a new form</strong>
                  </span>
                </v-flex>
                <v-flex>
                  <span>its rewind time</span>
                </v-flex>
              </v-layout>
            </v-flex>
          </v-layout>
              <v-divider />
        </v-flex>
        <v-flex xs12 md8>
          <!--<v-card flat tile>-->
            <!--<v-card-text class='pa-0'>-->
              <v-layout fill-height row wrap>
                <v-flex class='secondary' xs12 md4>
                  <v-card flat color='transparent'>
                    <v-card-title>
                      Section thisnnas
                    </v-card-title>
                  </v-card>
                </v-flex>
                <v-flex xs12 md8>
                  <v-card height='250' flat hover>
                    <v-card-text class='text-xs-center'>
                      Render Form Here
                    </v-card-text>
                  </v-card>
                </v-flex>
              </v-layout>
            <!--</v-card-text>-->
          <!--</v-card>-->
        </v-flex>
      </v-layout>
    </v-card-text>
  </v-card>
</template>
<script charset="utf-8">
export default {
  name: "CreateForm",
  data: () => ({
  })
}
</script>
