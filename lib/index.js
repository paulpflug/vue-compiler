(function() {
  var compile, compiler, fs, path;

  compiler = require("vueify").compiler;

  fs = require("fs");

  path = require("path");

  compile = function(filePath, out) {
    return compiler.compile(fs.readFileSync(filePath, {
      encoding: "utf8"
    }), filePath, function(err, result) {
      if (err) {
        throw err;
      }
      return fs.writeFile(out + path.basename(filePath, ".vue") + ".js", result, function(err) {
        if (err) {
          throw err;
        }
      });
    });
  };

  module.exports = function(program) {
    var filePath, i, len, ref, results;
    if (program.out == null) {
      throw new Error("--out must be specified");
    }
    if (program.out[program.out.length - 1] !== "/") {
      program.out += "/";
    }
    ref = program.args;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      filePath = ref[i];
      if (fs.existsSync(filePath)) {
        results.push(compile(filePath, program.out));
      } else {
        results.push(void 0);
      }
    }
    return results;
  };

}).call(this);
