echo "compile main"
EMMAKEN_CFLAGS="-g" ~/Dev/emscripten/tools/emmaken.py -g test.c -c -o test.bc

echo "link"
~/Dev/llvm-svn/cbuild/bin/llvm-link test.bc .libs/libgmp.a.bc -o complete.bc

echo "dissasseble"
~/Dev/llvm-svn/cbuild/bin/llvm-dis -show-annotations complete.bc -o complete.ll

echo "emscripten"
python ~/Dev/emscripten/emscripten.py -s CORRECT_OVERFLOWS=0 -s CORRECT_SIGNS=3 -s CORRECT_SIGNS_LINES='["mul_1.c:41", "mul_1.c:47", "add_n.c:47"]' -s CORRECT_ROUNDINGS=0 -s OPTIMIZE=1 -s RELOOP=0 -s ASSERTIONS=0 -s INIT_STACK=0 -s SAFE_HEAP=0 -s QUANTUM_SIZE=1 -s USE_TYPED_ARRAYS=0 --dlmalloc complete.ll > complete3.js

echo "done."

