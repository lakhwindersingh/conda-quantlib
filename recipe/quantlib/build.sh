#!/bin/bash

export MULTI_THREAD=6
export PREFIX=/opt/conda
export LD_LIBRARY_PATH=/opt/conda/lib

export CFLAGS="${CFLAGS} -I${PREFIX}/include"
export CXXFLAGS="${CFLAGS}"
export CPPFLAGS="-I${PREFIX}/include"
export LDFLAGS="${LDFLAGS} -L${PREFIX}/lib"

./autogen.sh
./configure --prefix=$PREFIX
make -j ${MULTI_THREAD}

make install
sudo make install
sudo ldconfig