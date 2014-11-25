#!/bin/bash

MACHINE="$(uname 2>/dev/null)"

export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="-L${PREFIX}/lib"

mkdir -p ${PREFIX}/bin || exit 1;

./configure --prefix="${PREFIX}" || return 1;
make || return 1;
make install || return 1;

