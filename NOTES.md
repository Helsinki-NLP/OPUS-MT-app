
# Standard locations on Mac OSX


* Where are the installed models?

```
$HOME/.config/translateLocally
```

* Where is the config file?

```
~/Library/Preferences/com.translatelocally.translateLocally.plist
```

# Links

* https://github.com/XapaJIaMnu/translateLocally
* https://github.com/browsermt/bergamot-translator
* https://github.com/browsermt/students/tree/master/train-student
* Mozilla browser app demo: https://mozilla.github.io/translate/

MT half	marathon tutorials (marianNMT)
* https://github.com/ricardorei/MT-Evaluation-Tutorial
* https://github.com/tilde-nlp/runtime-domain-adaptation-tutorial/blob/master/README.md
* https://nbogoychev.com/efficient-machine-translation/

mobile apps:
* https://medium.com/@applichic/flutter-google-translate-part-1-63b50c93d873



# Update to latest translatelocally code

```
# Add the remote, call it "upstream":

git remote add upstream https://github.com/whoever/whatever.git

# Fetch all the branches of that remote into remote-tracking branches

git fetch upstream

# Make sure that you're on your master branch:

git checkout master

# Rewrite your master branch so that any commits of yours that
# aren't already in upstream/master are replayed on top of that
# other branch:

git rebase upstream/master


# update submodules

git submodule update --remote --merge
```

See also https://stackoverflow.com/questions/7244321/how-do-i-update-or-sync-a-forked-repository-on-github


# Compilation on Mac OSX


* install dependencies via MacPorts:

```
port install qt5 qt5-qttools qt5-qtsvg libarchive libiconv OpenBLAS
```


* install Intel MKL (but that does not work via MacPorts I believe)
* compile

```
mkdir build
cd build
cmake -DUSE_APPLE_ACCELERATE=ON -DAPPLE=ON ..
make -j8
```

The following ports didn't work on my system (don't install - they will create conflicts!):

```
libiconv-bootstrap
gperf-bootstrap
qt6-qttools
qt6-qtsvg
protobuf3-cpp
```

Even after uninstalling qt6 it is still found by cmake. I had to manually remove QT6 from `CMakeLists.txt`

```
# find_package(QT NAMES Qt6 Qt5 COMPONENTS Core Gui PrintSupport Widgets LinguistTools Network DBus Svg REQUIRED)
find_package(QT NAMES Qt5 COMPONENTS Core Gui PrintSupport Widgets LinguistTools Network DBus Svg REQUIRED)
```




## Problem with linking to correct libiconv

I had big trouble linking to iconv and got something like this

```
Undefined symbols for architecture x86_64:
  "_iconv", referenced from:
      _mariadb_convert_string in my_charset.c.o
  "_iconv_close", referenced from:
      _mariadb_convert_string in my_charset.c.o
  "_iconv_open", referenced from:
      _mariadb_convert_string in my_charset.c.o
ld: symbol(s) not found for architecture x86_64
```

This is a known issue discussed in various places like

* https://stackoverflow.com/questions/27392085/cant-link-to-iconv-on-os-x
* https://stackoverflow.com/questions/57734434/libiconv-or-iconv-undefined-symbol-on-mac-osx

A fix for me was to explicitly add the correct lib-file to `CMakeLists.txt` (assuming that the path is the correct one on your system):

```
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} /opt/local/lib/libiconv.a")
```

Additional links that could help

* https://stackoverflow.com/questions/11783932/how-do-i-add-a-linker-or-compile-flag-in-a-cmake-file
* https://cmake.org/cmake/help/latest/module/FindIconv.html


Would something like this work (with appropriate names replacing the template)?

``
target_link_libraries(LibsModule -L/home/user/libs/somelibpath/)
target_link_libraries(LibsModule liblapack.a)
target_link_libraries(MyProgramExecBlaBla LibsModule)
```

