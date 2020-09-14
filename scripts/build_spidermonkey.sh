#!/bin/bash
#libspidermonkey:

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
export LD="armeb-linux-gnueabi-ld"
export RANLIB="armeb-linux-gnueabi-gcc-ranlib"

alias gcc='armeb-linux-gnueabi-gcc'
alias g++='armeb-linux-gnueabi-g++'
alias ar='armeb-linux-gnueabi-ar'
alias ld='armeb-linux-gnueabi-ld'
alias ranlib='armeb-linux-gnueabi-ranlib'

echo "new PATH=${PATH}"
cd ./builds
rm -rf js/
tar -xvf ../downloads/js-1.7.0.tar.gz
cd ./js/src
rm -rf Linux_All_DBG.OBJ
sed -i "s|CC = gcc|CC = ${CC}|g" config/Linux_All.mk
sed -i "s|CCC = g++|CCC = ${CXX}|g" config/Linux_All.mk
#sed -i 's|$(CC) -o $@ $(OBJDIR)/jscpucfg.o|cp ../../../jsautocfg.h Linux_All_DBG.OBJ/jsautocfg.h && touch Linux_All_DBG.OBJ/jsautocfg.h|g' Makefile.ref
sed -i 's|$(OBJDIR)/jscpucfg > $@|cp ../../../jsautocfg.h Linux_All_DBG.OBJ/jsautocfg.h \&\& touch Linux_All_DBG.OBJ/jsautocfg.h|g' Makefile.ref
sed -i 's|$(OBJDIR)/jskwgen$(HOST_BIN_SUFFIX) $@|cp ../../../jsautokw.h Linux_All_DBG.OBJ/jsautokw.h \&\& touch Linux_All_DBG.OBJ/jsautokw.h|g' Makefile.ref
sed -i 's|$(MKSHLIB) -o $@ $(LIB_OBJS) $(LDFLAGS) $(OTHER_LIBS)|$(MKSHLIB) -o $@ $(LIB_OBJS)|g' rules.mk
make  -f Makefile.ref
cp  -ap editline/Linux_All_DBG.OBJ "${LIBDIR}/editline"
cp Linux_All_DBG.OBJ/js  "${PREFIX}/bin/"
cp Linux_All_DBG.OBJ/libjs*  "${LIBDIR}/"
