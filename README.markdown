
gmp.js
======

gmp.js is a port of the GNU Multiple-Precision Library (GMP), a library
for arbitrary precision arithmetic, to JavaScript using Emscripten.

GMP website: http://gmplib.org/


Steps to build
--------------

* First run configure and make natively/normally. You will need some
  of the generated executables. Optionally, also build test.c and see
  that it works (see instructions inside test.c).

* Run configure using something like

  EMMAKEN_JUST_CONFIGURE=1 RANLIB=~/Dev/emscripten/tools/emmaken.py AR=~/Dev/emscripten/tools/emmaken.py CXX=~/Dev/emscripten/tools/emmakenxx.py CC=~/Dev/emscripten/tools/emmaken.py ./configure --build=none --host=none

* Edit gmp.h and disable LIKELY, UNLIKELY

* Edit config.h and disable HAVE_QUAD_T, HAVE_OBSTACK_VPRINTF, HAVE_LONG_DOUBLE and HAVE_LONG_LONG

* Run make using something like

  EMMAKEN_CFLAGS="-g" make -j 2

* Run emscripten.sh which will build the main test file, link it, then
  compile to JavaScript using Hmscripten

* Optionally, optimize using the Emscripten eliminator and/or closure compiler,

  ~/Dev/emscripten/tools/eliminator/node_modules/coffee-script/bin/coffee ~/Dev/emscripten/tools/eliminator/eliminator.coffee < complete.js > complete.elim.js

  java -Xmx1024m -jar CLOSURE_COMPILER --compilation_level ADVANCED_OPTIMIZATIONS --variable_map_output_file src.cpp.o.js.vars --js complete.js --js_output_file complete.cc.js

* Run the code using something like

  js -m -n complete.js 500

