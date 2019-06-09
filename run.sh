#!/bin/bash

if [ ! -f "$0" ]; then
    echo "You should pass SSH directory as an argument"
    exit 1
fi

docker run -it --rm \
    --name streisand-vpn \
    -v $0:/root/.ssh \
    streisand-vpn

exit 0