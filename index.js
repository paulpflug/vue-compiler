#!/usr/bin/env node
var program = require('commander')
  , fs = require('fs')
  , path = require('path')
  , cwd = process.cwd()
program
  .version(JSON.parse(fs.readFileSync(path.join(__dirname, 'package.json'), 'utf8')).version)
  .usage('[options] <file ...>')
  .option('--out <folder>', 'out')
  .parse(process.argv);

require("./lib/index.js")(program)
