#!/bin/bash

set -e # Stop script on error

echo "Downloading and Compiling ModSecurity 3.0 Source Code"

# Clone the GitHub repository
git clone --depth 1 -b v3/master --single-branch https://github.com/SpiderLabs/ModSecurity
cd ModSecurity

# Compile the source code
git submodule init
git submodule update
./build.sh
./configure
make
make install