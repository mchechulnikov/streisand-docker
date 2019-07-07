#!/bin/bash

if [ ! -d $1 ]; then
    echo "You should pass SSH directory as an argument"
    exit 1
fi

mkdir -p ./vpn-docs

docker run -it --rm \
    --name streisand-vpn \
    -v "$PWD"/vpn-docs:/docs \
    -v $1:/root/.ssh \
    streisand-vpn