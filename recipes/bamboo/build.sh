#!/bin/bash
declare -a CMAKE_PLATFORM_FLAGS
if [ "$(uname)" == "Linux" ]; then
    CMAKE_PLATFORM_FLAGS+=("-DCMAKE_TOOLCHAIN_FILE=${RECIPE_DIR}/cross-linux.cmake")
fi
${PYTHON} -m pip install . -vv --global-option="${CMAKE_PLATFORM_FLAGS[@]}"
