How to install go on the Raspberry Pi 4B
========================================

First, copy `tools/install-go.sh` to the RPi. 

## Prerequisites : 

The RPi OS and the `rpi-rgb-led-matrix` library must be installed according to the procedure 
documented in https://github.com/francoisgeorgy/led-cube/blob/main/os-installation.md. 

## Install `go` : 

Log into the RPi and to : 

    chmod +x install-go.sh
    ./install-go.sh

Restart the shell or logoff/login and test : 

    $ go version
    go version go1.21.5 linux/arm

Logout/login again to force the reload of .profile

(you can also do `source .profile`)


## Test `ledcat` : 

    cat /dev/random | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
        --led-rows=64 --led-cols=64 --led-chain=3 --led-parallel=2 --led-slowdown-gpio=5 --led-brightness=33


## Install `shady` :

The following package must be installed prior to shady : 

    sudo apt install libegl-dev -y 

Install shady : 

    go install github.com/polyfloyd/shady/cmd/shady@latest

Copy the GLSL scripts : 

On the cube, make a directory for the glsl scripts : 

    cd /home/cube
    git clone https://github.com/francoisgeorgy/led-cube-shaders.git shaders

Test `shady` : 

    cd /home/cube/shaders

    export EGL_PLATFORM=surfaceless
    export MESA_GL_VERSION_OVERRIDE=3.3

    shady -ofmt rgb24 -g 192x128 -f 20 -i src/scripts/plasma.glsl \
        | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
            --led-rows=64 --led-cols=64 --led-slowdown-gpio=5 \
            --led-parallel=2 --led-chain=3 --led-brightness=65







    shady -ofmt rgb24 -g 192x128 -f 20 -i src/scripts/plasma.glsl -w \
        | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
            --led-rows=64 --led-cols=64 --led-slowdown-gpio=5 \
            --led-parallel=2 --led-chain=3 --led-brightness=33



    shady -ofmt rgb24 -g 128x64 -f 20 -i src/scripts/plasma.glsl \
        | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
            --led-brightness=40 \
            --led-rows=64 --led-cols=128 --led-slowdown-gpio=5 \
            --led-parallel=1 --led-chain=1 


    shady -ofmt rgb24 -g 128x64 -f 20 -i src/scripts/plasma.glsl \
        | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
            --led-brightness=40 \
            --led-rows=64 --led-cols=128 --led-slowdown-gpio=5
