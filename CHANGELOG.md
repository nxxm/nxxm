# nxxm : CHANGELOG

## ALPHA v0.0.8 
### Features
* Webassembly builds with wasm threads, emscripten 1.39.5 & NodeJS v14.2.0
* Smart parallel build based on available CPU and RAM when `-j` not specified
* HTML5 embedded C++ code is now better debuggable as column and line positions of compile errors are exactly reported 
* CMake upgraded to version 3.17.2
* Platform libraries to the latest version ( e.g. Boost 1.73.0, Poco 1.10.1, Qt 5.11.3... )
* Proper isolation of $HOME/.nxxm files in corresponding nxxm distro ( Now .nxxm/0000001 )
* Better isolation from host system, only additional tools can be found by nxxm, but library, header and module search never escapes the nxxm builds
* Command line parameter parsing relaxed and meaningful errors
* In verbose mode the spinner widget for long-lasting operation is hidden to generate only useful log informations.

### Bug fixes
* Now -DEFINE passed on the command line doesn't prevent further options to be taken in account
* nxxm now closes correctly after timeout SSL connections that don't gracefully close
* disabled macOS ask for Java installation anymore in webassembly build mode
* better information when accessing private repositories

Welcome to our new contributors that joined during this release Luc [Lambourl](https://github.com/Lambourl) and Marouane [amri04](https://github.com/amri04) !

##### Archives Checksums
nxxm-v0.0.8-linux-x86_64.zip:187A5B8AE32F54EAAE5DD2A4221F65395F020868
nxxm-v0.0.8-macOS.zip:C3E3273A19D5FE0CCDE956FD6C351840947C6353
nxxm-v0.0.8-windows-win64.zip:90F067222B2208BF8DB50FC73B89E97108D28606

## v0.0.7
* Build by convention by default &amp; Ignores CMakeLists.txt by default unless `-u, --use-cmakelists` or `{ "u" : true }` (or use-cmake.nxxm file is present) is specified on the command line or in `.nxxm/deps`.
* Adds the possibility to only build one of the executable in directory : `-o, --only <executable>` 
* Adds the possibility to select the build type : `-C, --config <MinSizeRel,Release,RelWithDebInfo,Debug>` which enables optimizations or debug symbols accordingly.
* Fix passing apps return code when run with `--test all, appname`
* Fix detection of main function in modern style and more generally with different types and argument count. (See https://github.com/nxxm/nxxm/issues/2) 
* Fix running on plain-vanilla Ubuntu 16.04 (that don't have C++17 libstdc++)

##### Archives Checksums
nxxm-v0.0.7-linux-x86_64.zip:A40147E4AC4659398CB5934D45282D094AC2C34B
nxxm-v0.0.7-macOS.zip:C0277D7FFF02E5FA3827EA421A38B652202BA7F4
nxxm-v0.0.7-windows-win64.zip:82CEF705A968B7633A96AA1250B7C8964E62CD0F


## v0.0.6
* minor bugfix release regarding upgrd code

## v0.0.5
* Initial open release 🎁 🎉 



