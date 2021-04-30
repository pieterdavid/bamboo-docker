#!/bin/bash

declare -a CMAKE_PLATFORM_FLAGS
if [ "$(uname)" == "Linux" ]; then
    CMAKE_PLATFORM_FLAGS+=("-DCMAKE_TOOLCHAIN_FILE=${RECIPE_DIR}/cross-linux.cmake")
fi

mkdir -p build
cd build
cmake -LAH \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
  "${CMAKE_PLATFORM_FLAGS[@]}" \
  ..

make -j${CPU_COUNT}
make install
