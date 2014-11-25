#!/bin/bash

mkdir cmake-build && cd cmake-build


export CC=${PREFIX}/bin/cc
export CXX=${PREFIX}/bin/c++

export CMAKE_MODULE_PATH=${PREFIX}

# this is apparently needed to locate libstdc++
export LD_LIBRARY_PATH=${PREFIX}/lib64:${PREFIX}/lib

# TODO:
# mysql/postgresql support
# c++11/c++14 standards
# pythia
# pcre

#    -DPYTHON_LIBRARY={python_install_dir}/lib/libpython2.7.so
# -DPYTHON_INCLUDE_DIR={python_install_dir}/include/python2.7 
# -DPYTHIA6_LIBRARY={pythia_install_dir}/lib/libPythia6.so 
# -DPOSTGRESQL_INCLUDE_DIR={postgresql_install_dir}/include 
# -DPOSTGRESQL_LIBRARIES={postgresql_install_dir}/lib/libpq.so 
# -DMYSQL_CONFIG_EXECUTABLE={mysql_install_dir}/bin/mysql_config 
# -DFFTW_INCLUDE_DIR={fftw_install_dir}/include 
# -DFFTW_LIBRARY={fftw_install_dir}/lib/libfftw3.so 
# -DGCCXML_EXECUTABLE={gccxml_install_dir}/bin/gccxml 
# -DCMAKE_C_COMPILER={gcc_install_dir}/bin/gcc 
# -DCMAKE_CXX_COMPILER:STRING={gcc_install_dir}/bin/g++

cmake \
    -Dgnuinstall=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX=${PREFIX} \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_C_COMPILER=${PREFIX}/bin/gcc \
    -DCMAKE_CXX_COMPILER=${PREFIX}/bin/g++ \
    -DGCCXML_EXECUTABLE=${PREFIX}/bin/gccxml \
    -Drpath=OFF \
    -Dfftw3=ON \
    -DFFTW_INCLUDE_DIR=${PREFIX}/include \
    -DFFTW_LIBRARY=${PREFIX}/lib/libfftw3.so \
    -Dasimage=ON \
    -Dbuiltin_afterimage=OFF \
    -Dminuit2=ON -Dc++11=OFF \
    -Dxrootd=ON -Dssl=ON \
    -Dpython=ON -Dgdml=ON -Dxml=ON -Dxft=OFF -Dx11=ON -Dqt=ON -Dshared=ON \
    ..

make
make install
