#!/bin/bash
mkdir -p downloads
cd downloads
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/gcc-linaro-7.5.0-2019.12-x86_64_armeb-linux-gnueabi.tar.xz
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/gcc-linaro-7.5.0-2019.12-x86_64_armeb-linux-gnueabi.tar.xz.asc
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/runtime-gcc-linaro-7.5.0-2019.12-armeb-linux-gnueabi.tar.xz
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/runtime-gcc-linaro-7.5.0-2019.12-armeb-linux-gnueabi.tar.xz.asc
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/sysroot-glibc-linaro-2.25-2019.12-armeb-linux-gnueabi.tar.xz
wget -nv https://releases.linaro.org/components/toolchain/binaries/7.5-2019.12/armeb-linux-gnueabi/sysroot-glibc-linaro-2.25-2019.12-armeb-linux-gnueabi.tar.xz.asc
wget -nv https://master.dl.sourceforge.net/project/libpng/libpng12/older-releases/1.2.29/libpng-1.2.29.tar.gz
wget -nv https://www.zlib.net/fossils/zlib-1.2.3.tar.gz
wget -nv https://github.com/manugarg/pacparser/releases/download/1.3.7/pacparser-1.3.7.tar.gz
wget -nv https://github.com/openssl/openssl/archive/OpenSSL_1_0_1j.tar.gz
#wget -nv https://freefr.dl.sourceforge.net/project/gsoap2/gsoap-2.7/gsoap_2.7.13.zip
wget -nv https://archive.mozilla.org/pub/spidermonkey/releases/1.7.0/js-1.7.0.tar.gz
wget -nv https://github.com/libexpat/libexpat/archive/R_2_1_0.tar.gz
#wget -nv https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-1096.40.7.tar.gz
#wget -nv https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-625.41.2.tar.gz
wget -nv https://opensource.apple.com/tarballs/mDNSResponder/mDNSResponder-333.10.gz
wget -nv https://github.com/jpmens/jo/archive/refs/tags/1.4.tar.gz -O jo-1.4.tar.gz
