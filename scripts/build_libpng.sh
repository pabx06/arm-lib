#!/bin/bash
#libpng

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
ZLIB_PATH="${PWD}/install"
ZLIB_INCLUDE="${ZLIB_PATH}/includedir"
ZLIB_LIB="${ZLIB_PATH}/libdir"


echo "new PATH=${PATH}"

cd ./builds/libpng-1.2.29/
#./configure  --shared --prefix=$PREFIX --exec_prefix=$EXPREFIX --libdir=$LIBDIR --includedir=$INCLUDEDIR
./configure --host="armeb-linux-gnueabi"  --prefix=$PREFIX --exec_prefix=$PREFIX --libdir=$LIBDIR --includedir=$INCLUDEDIR  CFLAGS="${DEBUG_ALL}" CPPFLAGS="-I${ZLIB_INCLUDE} -L${ZLIB_LIB}" LDFLAGS="-L${ZLIB_LIB}" CHOST="arm"
make clean
make
make install
