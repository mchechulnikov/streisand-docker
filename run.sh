#!/bin/bash

if [ ! -d $1 ]; then
    echo "You should pass SSH directory as an argument"
    exit 1
fi

docker run -it --rm \
    --name streisand-vpn \
    -v "$PWD":/docs:cached \
    -v $1:/root/.ssh \
    streisand-vpn \
    /bin/bash ./streisand && cp ./generated-docs /docs