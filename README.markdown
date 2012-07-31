gmp.js
======

gmp.js is a port of the GNU Multiple-Precision Library (GMP), a library
for arbitrary precision arithmetic, to JavaScript using Emscripten.

GMP website: http://gmplib.org/


Steps to build
--------------

* First run configure and make natively/normally. You will need some
  of the generated executables. Optionally, also build ``test.c`` and see
  that it works (see instructions inside ``test.c``).

* Run configure using something like

        EMMAKEN_JUST_CONFIGURE=1 RANLIB=~/Dev/emscripten/emcc AR=~/Dev/emscripten/emcc CXX=~/Dev/emscripten/emcc CC=~/Dev/emscripten/emcc ./configure --build=none --host=none

* Edit ``gmp.h`` and disable ``LIKELY``, ``UNLIKELY``

* Edit ``config.h`` and disable ``HAVE_QUAD_T``, ``HAVE_OBSTACK_VPRINTF``, ``HAVE_LONG_DOUBLE`` and ``HAVE_LONG_LONG``

* Run make using something like

        EMMAKEN_CFLAGS="-g" make -j 2

* Run ``emscripten.sh`` which will build the main test file, link it, then
  compile to JavaScript using Emscripten

* Run the code using something like

        js -m -n complete.js 500

