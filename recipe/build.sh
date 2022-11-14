#!/bin/bash
# *****************************************************************
# (C) Copyright IBM Corp. 2018, 2021. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# *****************************************************************

# Create build directory for cmake and enter it
mkdir $SRC_DIR/build
cd $SRC_DIR

# Make unique location for libjpeg-turbo to live so it does not conflict with jpeg
mkdir -p $PREFIX/lib

# Configure the build to install in unique location
cd build
cmake -G"Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$PREFIX/ \
      -DCMAKE_INSTALL_LIBDIR="$PREFIX/lib" \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_STATIC=1 \
      -DENABLE_SHARED=1 ..
      #-DCMAKE_ASM_NASM_COMPILER=yasm ..

# Build
make
make install

# Move .so to $PREFIX/lib
#cp $PREFIX/libjpeg-turbo/lib64/libjpeg.so.* $PREFIX/lib
