# vue-compiler

a simple cli wrapper around the vue-component-compiler.
Includes no supported languages.

## Install
```sh
npm install --save-dev vue-compiler
// vue@1.0
npm install --save-dev vue-compiler@1
```

## dependencies
script
---
-  babel
```
npm install --save-dev babel-core babel-runtime babel-preset-es2015 babel-plugin-transform-runtime
```   
-  coffee-script
```
npm install --save-dev coffee-script
```

template
---
- pug
```
npm install --save-dev pug
```

style
---
- when using any style
```
npm install --save vueify-insert-css
```
- less
```
npm install --save-dev less
```
- sass
```
npm install --save-dev node-sass
```
- stylus
```
npm install --save-dev stylus
```

hot reloading
---
```
npm install --save-dev vue-hot-reload-api
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

## Changelog
- 2.0.0  
now compatible with vue 2.0.0  

- 1.0.0  
same as 0.3.0  

## License
Copyright (c) 2015 Paul Pflugradt
Licensed under the MIT license.
