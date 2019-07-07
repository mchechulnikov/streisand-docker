#!/bin/bash

echo SSH files:
pushd /root/.ssh
ls -a
popd

./streisand

ls
cp ./generated-docs /docs