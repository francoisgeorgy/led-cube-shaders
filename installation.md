## Install `go` : 

Copy tools/install-go.sh into the server

Server : 

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

    sudo apt install libegl-dev 

Install shady : 

    go install github.com/polyfloyd/shady/cmd/shady@latest

Note: the install is silent. Only errors are printed if any.

Copy the GLSL scripts : 

    rsync -avin src/glsl francois@192.168.1.101:/home/cube/

Test `shady` : 

    cd /home/cube

    export EGL_PLATFORM=surfaceless
    export MESA_GL_VERSION_OVERRIDE=3.3

    shady -ofmt rgb24 -g 192x128 -f 20 -i glsl/scripts/plasma.glsl \
        | sudo /home/cube/rpi-rgb-led-matrix/examples-api-use/ledcat \
            --led-rows=64 --led-cols=64 --led-slowdown-gpio=5 \
            --led-parallel=2 --led-chain=3 --led-brightness=65

