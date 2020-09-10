# *****************************************************************
#
# Licensed Materials - Property of IBM
#
# (C) Copyright IBM Corp. 2018, 2020. All Rights Reserved.
#
# US Government Users Restricted Rights - Use, duplication or
# disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
#
# *****************************************************************
#!/bin/bash

# Create build directory for cmake and enter it
mkdir $SRC_DIR/build
cd $SRC_DIR

# Make unique location for libjpeg-turbo to live so it does not conflict with jpeg
mkdir -p $PREFIX/libjpeg-turbo

# Configure the build to install in unique location
cd build
cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$PREFIX/libjpeg-turbo ..

# Build
make
make install

# Move .so to $PREFIX/lib
cp $PREFIX/libjpeg-turbo/lib64/libjpeg.so.* $PREFIX/lib
