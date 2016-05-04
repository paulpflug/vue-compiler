# vue-compiler

a simple cli wrapper around the vue-component-compiler.
Includes no supported languages.

## Install

```sh
npm install --save-dev vue-compiler

```
## dependencies
-  babel
```
npm install --save-dev babel-core babel-runtime babel-preset-es2015 babel-plugin-transform-runtime
```   
-  coffee-script
```
npm install --save-dev coffee-script
```
- pug
```
npm install --save-dev pug
```
- less
```
npm install --save-dev less
```
- sass
```
npm install --save-dev node-sass
```
- hot reloading
```
npm install --save-dev vue-hot-reload-api
```
- when using `<style></style>`
```
npm install --save-dev vueify-insert-css
```

## Usage

```
Usage: vue-compiler [options] <file ...>

  Options:

    -h, --help      output usage information
    -V, --version   output the version number
    --out <folder>  out

```

## Example

```sh
vue-compiler --out test/ test/test.vue
```

## Release History

 - *v0.0.1*: First release

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.
