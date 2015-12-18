(function() {
  var compiler, fs, path;

  compiler = require("vueify").compiler;

  fs = require("fs");

  path = require("path");

  module.exports = function(program) {
    var filePath, i, len, ref, results;
    if (program.out == null) {
      throw new Error("--out must be specified");
    }
    ref = program.args;
    results = [];
    for (i = 0, len = ref.length; i < len; i++) {
      filePath = ref[i];
      if (fs.existsSync(filePath)) {
        results.push(compiler.compile(fs.readFileSync(filePath, {
          encoding: "utf8"
        }), function(err, result) {
          if (err) {
            throw err;
          } else {
            return fs.writeFileSync(program.out + path.basename(filePath, ".vue") + ".js", result);
          }
        }));
      } else {
        results.push(void 0);
      }
    }
    return results;
  };

}).call(this);
