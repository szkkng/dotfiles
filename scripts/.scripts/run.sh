#!/bin/bash -eu

set +e
pkill -f build/*artefacts/Debug/Standalone/*.app/Contents/MacOS/*
rm -rf build/*artefacts/Debug/Standalone/*.app/Contents/MacOS/*
set -e

cmake -G Ninja -S . -B build -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -DCMAKE_BUILD_TYPE=Debug
cmake --build build -j8
build/*artefacts/Debug/Standalone/*.app/Contents/MacOS/*
