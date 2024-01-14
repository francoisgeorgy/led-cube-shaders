#!/bin/bash

export EGL_PLATFORM=surfaceless
export MESA_GL_VERSION_OVERRIDE=3.3

if [[ -z "$1" ]]; then
    echo "usage: $0 SHADER-SCRIPT"
    exit 1
fi

LEDCAT="/home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat"

script="$1"

shady -ofmt rgb24 -g 192x128 -f 20 -i "${script}" \
    | sudo $LEDCAT \
        --led-rows=64 --led-cols=64 --led-slowdown-gpio=5 \
        --led-parallel=2 --led-chain=3 --led-brightness=65

