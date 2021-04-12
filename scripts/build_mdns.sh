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

DEBUG_ALL=" -ggdb -Og -fno-eliminate-unused-debug-symbols -g3   -fno-eliminate-unused-debug-types"
export CFLAGS="${DEBUG_ALL}" # -I ../mDNSCore -I ../mDNSShared -DNOT_HAVE_SA_LEN
#export CXXFLAGS="${DEBUG_ALL}"
export ST="true"
export CC="armeb-linux-gnueabi-gcc"
export LD="armeb-linux-gnueabi-ld -shared"
export AR="armeb-linux-gnueabi-ar"
export RANLIB="armeb-linux-gnueabi-gcc-ranlib"


VERSION="mDNSResponder-625.41.2"

echo "[+] new PATH=${PATH}"

rm -rf "./builds/${VERSION}"
cd ./builds
tar -xf "../downloads/${VERSION}.tar.gz" && echo "[+] Archive extracted"
cd "./${VERSION}/mDNSPosix"
echo "[+] Patching stuff"
#patch ../mDNSCore/mDNS.c ../../../mDNS.patch
patch ./Makefile ../../../MakeFile-mDNSResponder-625.41.2.patch

echo "[*] current working dir is ${PWD}"
make CC="${CC}" RANLIB="${RANLIB}" LD="${LD}" ST="${ST}" CFLAGS="${CFLAGS}" os="linux" 

