# nxxm : CHANGELOG

## v0.0.7
* Build by convention by default &amp; Ignores CMakeLists.txt by default unless `-u, --use-cmakelists` or `{ "u" : true }` (or use-cmake.nxxm file is present) is specified on the command line or in `.nxxm/deps`.
* Adds the possibility to only build one of the executable in directory : `-o, --only <executable>` 
* Adds the possibility to select the build type : `-C, --config <MinSizeRel,Release,RelWithDebInfo,Debug>` which enables optimizations or debug symbols accordingly.
* Fix passing apps return code when run with `--test all, appname`
* Fix detection of main function in modern style and more generally with different types and argument count. (See https://github.com/nxxm/nxxm/issues/2) 

##### Archives Checksums
nxxm-v0.0.7-linux-x86_64.zip:A40147E4AC4659398CB5934D45282D094AC2C34B
nxxm-v0.0.7-macOS.zip:C0277D7FFF02E5FA3827EA421A38B652202BA7F4
nxxm-v0.0.7-windows-win64.zip:82CEF705A968B7633A96AA1250B7C8964E62CD0F


## v0.0.6
* minor bugfix release regarding upgrd code

## v0.0.5
* Initial open release 🎁 🎉 



