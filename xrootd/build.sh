#!/bin/bash


export CMAKE_MODULE_PATH=${PREFIX}

# this is apparently needed to locate libstdc++
export LD_LIBRARY_PATH=${PREFIX}/lib64:${PREFIX}/lib

mkdir cmake-build && cd cmake-build
cmake \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=${PREFIX}/bin/gcc \
    -DCMAKE_CXX_COMPILER=${PREFIX}/bin/g++ \
    -DENABLE_CRYPTO=FALSE \
    -DENABLE_PERL=FALSE \
    -DOPENSSL_ROOT_DIR=${PREFIX} \
    -DREADLINE_ROOT_DIR=${PREFIX} \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    ..

make 
make install
