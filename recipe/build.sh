#!/bin/bash
platform='unknown'
unamestr=`uname`

cp $RECIPE_DIR/build.conf build.conf

sed -i -e "s:PREFIX:$PREFIX:g" build.conf

export LIBRARY_PATH="${PREFIX}/lib"
export LD_LIBRARY_PATH="${PREFIX}/lib"

$PYTHON setup.py build --cython
$PYTHON setup.py install
