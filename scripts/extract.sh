#!/bin/bash
rm -rf builds
mkdir builds
cd builds

tar -xf ../downloads/gcc-linaro-7.5.0-2019.12-x86_64_armeb-linux-gnueabi.tar.xz
tar -xvf ../downloads/libpng-1.2.29.tar.gz
tar -xvf ../downloads/zlib-1.2.3.tar.gz
tar -xvf ../downloads/pacparser-1.3.7.tar.gz
tar -xvf ../downloads/OpenSSL_1_0_1j.tar.gz
unzip  ../downloads/gsoap_2.7.13.zip
tar -xvf ../downloads/js-1.7.0.tar.gz
tar -xvf ../downloads/R_2_1_0.tar.gz
tar -xvf ../downloads/jo-1.4.tar.gz