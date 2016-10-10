# out: ../lib/index.js

{compiler} = require "vueify"
fs = require "fs"
path = require "path"

compile = (filePath, out) ->
  compiler.compile fs.readFileSync(filePath, encoding:"utf8"), filePath, (err,result) ->
    throw err if err
    fs.writeFile out+path.basename(filePath,".vue")+".js", result, (err) ->
      throw err if err
module.exports = (program) ->
  unless program.out?
    throw new Error "--out must be specified"
  program.out += "/" unless program.out[program.out.length-1] == "/"

  for filePath in program.args
    if fs.existsSync(filePath)
      compile filePath, program.out
