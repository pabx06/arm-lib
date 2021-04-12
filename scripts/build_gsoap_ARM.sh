#!/bin/bash
#libgsoap:

export PATH="${PWD}/builds/gcc-linaro-7.5.0-2019.12-x86_64_armeb-linux-gnueabi/bin:$PATH"
export PREFIX="${PWD}/install/prefix"
export EXPREFIX="${PWD}/install/exprefix"
export LIBDIR="${PWD}/install/libdir"
export INCLUDEDIR="${PWD}/install/includedir"
DEBUG_ALL="-fPIC -ggdb -Og -fno-eliminate-unused-debug-symbols -g3   -fno-eliminate-unused-debug-types -DWITH_LEAN"
export CFLAGS=$DEBUG_ALL
#export CXXFLAGS=$DEBUG_ALL
#export CHOST="arm"
export CC="armeb-linux-gnueabi-gcc"
export AR="armeb-linux-gnueabi-ar"
#export LD="armeb-linux-gnueabi-ld"
export RANLIB="armeb-linux-gnueabi-gcc-ranlib"

#export CC="clang"
#export CXX="clang++"

#export AR="llvm-ar"
#export LD="armeb-linux-gnueabi-ld"
#export RANLIB="llvm-ranlib"

#alias gcc='armeb-linux-gnueabi-gcc'
#alias g++='armeb-linux-gnueabi-g++'
#alias ar='armeb-linux-gnueabi-ar'
#alias ld='armeb-linux-gnueabi-ld'
#alias ranlib='armeb-linux-gnueabi-ranlib'


echo "new PATH=${PATH}"
rm -rf ./builds/gsoapARM/gsoap-2.7/
cd ./builds
unzip ../downloads/gsoap_2.7.13.zip -d gsoapARM
cd gsoapARM/gsoap-2.7

#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${LIBDIR}:${PREFIX}"
#sed -i 's|AC_FUNC_MALLOC||g' builds/gsoap-2.7/configure.in
aclocal
autoheader
automake --add-missing
autoconf
automake
./configure --host="armeb-linux-gnueabi"  --prefix="${PREFIX}" --exec_prefix="${PREFIX}" --libdir="${LIBDIR}" --includedir="${INCLUDEDIR}"
#./configure
make clean || true
make || true
#make install
