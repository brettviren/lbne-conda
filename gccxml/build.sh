#!/bin/bash

# this is apparently needed to locate libstdc++
export LD_LIBRARY_PATH=${PREFIX}/lib64:${PREFIX}/lib


mkdir build && cd build
cmake \
    -DCMAKE_C_COMPILER=${PREFIX}/bin/gcc \
    -DCMAKE_CXX_COMPILER=${PREFIX}/bin/g++ \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_BUILD_TYPE=Release \
    ..
make -j "$CPU_COUNT"
make install 

