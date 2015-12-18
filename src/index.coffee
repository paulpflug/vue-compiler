# out: ../lib/index.js

{compiler} = require "vueify"
fs = require "fs"
path = require "path"

module.exports = (program) ->
  unless program.out?
    throw new Error "--out must be specified"
  for filePath in program.args
    if fs.existsSync(filePath)
      compiler.compile fs.readFileSync(filePath, encoding:"utf8"), (err,result) ->
        if err
          throw err
        else
          fs.writeFileSync(program.out+path.basename(filePath,".vue")+".js", result)
