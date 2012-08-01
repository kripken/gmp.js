echo "bitcode ==> javascript"
~/Dev/emscripten/emcc -O0 --closure 0 test.c .libs/libgmp.a -o complete.js

