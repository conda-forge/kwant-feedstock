#!/bin/bash
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
   cp $RECIPE_DIR/build_mac.conf build.conf
else
   cp $RECIPE_DIR/build_linux.conf build.conf
fi

export LIBRARY_PATH="${CONDA_PREFIX}/lib"
export LD_LIBRARY_PATH="${CONDA_PREFIX}/lib"

$PYTHON setup.py build
$PYTHON setup.py install
