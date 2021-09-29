#!/bin/bash
platform='unknown'
unamestr=`uname`

if [[ "$build_variant" == "mpi" ]]; then
   # todo
elif [[ "$build_variant" == "nompi" ]]; then
   # todo
fi


if [[ "$unamestr" == 'Darwin' ]]; then
   cp $RECIPE_DIR/build_mac.conf build.conf
else
   cp $RECIPE_DIR/build_linux.conf build.conf
fi

sed -i -e "s:PREFIX:$PREFIX:g" build.conf

export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

$PYTHON setup.py build --cython
$PYTHON setup.py install
