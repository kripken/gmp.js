echo "bitcode ==> javascript"
~/Dev/emscripten/emcc -O2 --closure 0 test.c .libs/libgmp.a.bc -o complete.js

