#!/bin/bash
#zlib:
export PATH="${PWD}/builds/gcc-linaro-7.5.0-2019.12-x86_64_armeb-linux-gnueabi/bin:$PATH"
export PREFIX="${PWD}/install/prefix"
export EXPREFIX="${PWD}/install/exprefix"
export LIBDIR="${PWD}/install/libdir"
export INCLUDEDIR="${PWD}/install/includedir"
DEBUG_ALL="-fPIC -ggdb -Og -fno-eliminate-unused-debug-symbols -g3   -fno-eliminate-unused-debug-types"
export CFLAGS=$DEBUG_ALL
export CXXFLAGS=$DEBUG_ALL
export CHOST="arm"
export CC="armeb-linux-gnueabi-gcc"
export AR="armeb-linux-gnueabi-ar"
export RANLIB="armeb-linux-gnueabi-gcc-ranlib"

echo "new PATH=${PATH}"

cd ./builds/zlib-1.2.3
./configure  --shared --prefix=$PREFIX --exec_prefix=$EXPREFIX --libdir=$LIBDIR --includedir=$INCLUDEDIR
make clean
make
make install
