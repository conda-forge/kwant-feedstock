#!/bin/bash
platform='unknown'
unamestr=`uname`

if [[ "$mpi" != 'nompi' ]]; then
   build_variant="mpi"
else
   build_variant="nompi"
fi

if [[ "$unamestr" == 'Darwin' ]]; then
   cp $RECIPE_DIR/build_mac_$build_variant.conf build.conf
else
   cp $RECIPE_DIR/build_linux_$build_variant.conf build.conf
fi

sed -i -e "s:PREFIX:$PREFIX:g" build.conf

export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

$PYTHON setup.py build --cython
$PYTHON setup.py install
