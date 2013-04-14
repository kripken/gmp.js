echo "bitcode ==> javascript"
~/Dev/emscripten/emcc -O2 test.c .libs/libgmp.a -o complete.js -s ASM_JS=1
# --llvm-lto 1

