#!/bin/bash
# name: fastfetch
# version: 2.31.0

set -e
wget https://github.com/fastfetch-cli/fastfetch/archive/refs/tags/2.31.0.tar.gz
tar -xf 2.31.0.tar.gz
cd fastfetch-2.31.0

cmake -B build -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
cmake --build build -j$(nproc)
DESTDIR="$DESTDIR" cmake --install build
