#!/bin/bash
#libcrypto
#https://gist.github.com/steakknife/8247726
#https://stackoverflow.com/questions/15539062/cross-compiling-of-openssl-for-linux-arm-v5te-linux-gnueabi-toolchain
#https://gcc.gnu.org/onlinedocs/gcc/Debugging-Options.html
#https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
#test

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
export LD="armeb-linux-gnueabi-ld"
export AR="armeb-linux-gnueabi-ar"
export RANLIB="armeb-linux-gnueabi-gcc-ranlib"
export MAKEDEPPROG="armeb-linux-gnueabi-gcc"
export PROCESSOR="ARM"

ZLIB_PATH="${PWD}/install"
ZLIB_INCLUDE="${ZLIB_PATH}/includedir"
ZLIB_LIB="${ZLIB_PATH}/libdir"


echo "new PATH=${PATH}"

rm -rf ./builds/openssl-OpenSSL_1_0_1j/
cd ./builds
tar -xvf ../downloads/OpenSSL_1_0_1j.tar.gz
cd ./openssl-OpenSSL_1_0_1j/

./Configure linux-generic32 shared   -DB_ENDIAN --prefix="${PREFIX}" --openssldir="${PREFIX}"  $DEBUG_ALL
sed -i 's| -O3||g' Makefile
make CC="${CC}" RANLIB="${RANLIB}" LD="${LD}" MAKEDEPPROG="${MAKEDEPPROG}" PROCESSOR="${PROCESSOR}"
make install
