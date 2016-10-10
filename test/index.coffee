chai = require "chai"
{exec} = require "child_process"
should = chai.should()
fs = require "fs"

cleanJS = ->
  try
    fs.unlinkSync "test/test1.js"
  try
    fs.unlinkSync "test/test2.js"
cleanVue = ->
  try
    fs.unlinkSync "test/test1.vue"
  try
    fs.unlinkSync "test/test2.vue"

describe "vue-compiler", ->
  before ->
    cleanJS()
    fs.writeFileSync "test/test1.vue" , """
      <template lang="pug">
      div test1
      </template>
      <style lang="stylus">
      div
        color: blue
      </style>
      <script lang="coffee">
      console.log "test1"
      module.exports =
        data: ->
          data: "test1"
      </script>
      """
    fs.writeFileSync "test/test2.vue" , """
      <template lang="pug">
      div test2
      </template>
      <script lang="coffee">
      console.log "test2"
      </script>
      """
  it "should compile vue file" , (done) ->
    exec "./index.js --out test/ test/test1.vue", {env: PATH: process.env.PATH,NODE_ENV: "production"}, (err,stdout,stderr) ->
      throw err if err
      fs.readFile "test/test1.js",encoding:"utf8", (err,data) ->
        throw err if err
        data.should.equal """
          var __vueify_style_dispose__ = require("vueify/lib/insert-css").insert("div{color:#00f}")
          ;(function(){
          console.log("test1");

          module.exports = {
            data: function() {
              return {
                data: "test1"
              };
            }
          };
          
          })()
          if (module.exports.__esModule) module.exports = module.exports.default
          var __vue__options__ = (typeof module.exports === "function"? module.exports.options: module.exports)
          __vue__options__.render = function(){with(this){return _m(0)}}
          __vue__options__.staticRenderFns = [function(){with(this){return _h('div',["test1"])}}]

        """
        done()
  it "should add hot reload when not in production", (done) ->
    exec "./index.js --out test/ test/test2.vue", {env: PATH: process.env.PATH}, (err,stdout,stderr) ->
      throw err if err
      fs.readFile "test/test2.js",encoding:"utf8", (err,data) ->
        throw err if err
        data.should.contain "vue-hot-reload"
        done()
  it "should work with wildcards", (done) ->
    exec "./index.js --out test/ test/*.vue", {env: PATH: process.env.PATH}, (err,stdout,stderr) ->
      throw err if err
      fs.lstatSync "test/test1.js"
      fs.lstatSync "test/test2.js"
      done()
  it "should work with multiple files", (done) ->
    exec "./index.js --out test/ test/test1.vue test/test2.vue", {env: PATH: process.env.PATH}, (err,stdout,stderr) ->
      throw err if err
      fs.lstatSync "test/test1.js"
      fs.lstatSync "test/test2.js"
      done()

  afterEach ->
    cleanJS()
  after ->
    cleanVue()
