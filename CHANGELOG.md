# nxxm : CHANGELOG

## v0.0.11 - codename **christmas cactus** 🎄🌵

### Features
  - [nxxm.io vscode plugin](https://marketplace.visualstudio.com/items?itemName=nxxm.nxxm) initial release !
  - Support for proper autocompletion in Visual Studio by generating `c_cpp_properties.json`

### Bug fixes
  - Internal nxxm.io commands are correctly processed in presence of folders or file of the same name
  - macOS nxxm upgrades are properly done with the nxxm.io vscode plugin

##### Archives Checksums
nxxm-v0.0.11-linux-x86_64.zip:62B85CC0E76DE4D9FBE83076BF9041882AD9B6EE
nxxm-v0.0.11-macOS.zip:4B72585CF72A1C7A33DFB5FB4BCA93A99A94A86B
nxxm-v0.0.11-windows-win64.zip:28497FE24949BAB0BB44E1CE87B1E9C4C940FFA4

## v0.0.10 - codename **far west hotfix**

### Bug fixes
  - Compiling a project by providing a relative path to it : `nxxm relative/path/to-project` now works.
  - Compiling a project that is stored in a Path where a folder has a space in the name is fixed. ( project folder with spaces don't ).

##### Archives Checksums
nxxm-v0.0.10-linux-x86_64.zip:6637A831EEC8997AC46121BF9A00C75B60422F48
nxxm-v0.0.10-macOS.zip:77B49BB0D6A2596BF8C71DA8994D0025FA06A465
nxxm-v0.0.10-windows-win64.zip:53F7FACEBBF8270D8640D42E867B5BAF264436BE

## v0.0.9 - codename **far west** 

### Features
  * `nxxm ci` automatically generates a docker enabled Github Action to build C & C++ code
  * Configurable Build engines via `build_engines_mapping.json`
  * Simplified the nxxm installation process thanks to the one liner install scripts now available
  * Support for macOS Big Sur
  * Default NodeJS included is 14.7.0
  * Default CMake included is 3.18.4
  * Possibility to specify `NXXM_HOME_DIR` on the environment, to specify the main nxxm download and build cache location ( _c.f._  [NXXM\_HOME\_DIR Documentation](https://nxxm-docs.readthedocs.io/en/latest/09-Dependencies_nxxm.html)
  * Build with Visual Studio 16 2019 MSVC via `nxxm . -t vs-16-2019-win64-cxx17`

### Bug fixes
  * Perl is now shipped by nxxm on Windows to accomodate special build processes including OpenSSL
  * Now multiple .cpp files at the top-level folder of an application project ( one with a main() and others without function) work.
  * Fixed build recipe generation for projects in different directories that current nxxm working directory
  * Fix host & cross compiling Boost on Windows
  * Now after 5 downloads retries, nxxm refuses to continue if the SHA1 checksum isn't correct. Precedent version would use the incorrect file.
  * Command line flags `--dont-upgrade, --force-upgrade, --auto-upgrade` can now be passed without any complaints from the options parser, to control nxxm auto-update feature.
  * Improved drastically the test suite to handle build corner cases found at our customers

### Known issues
  - Compiling a project by providing a relative path to it : `nxxm relative/path/to-project` doesn't work. `nxxm .` inside the folder of the project works. 
  - Compiling a project that is stored in a Path where a folder has a space in the name  doesn't work

##### Archives Checksums
nxxm-v0.0.9-linux-x86_64.zip:FE64B5D4DC96FA39BAA97659FAF6CB8F5C25031A
nxxm-v0.0.9-macOS.zip:91A47E79132B173CF2BB176A4E6693FAC8B48FCA
nxxm-v0.0.9-windows-win64.zip:308252401C2467F850611C9336782F5E28215EA1

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



