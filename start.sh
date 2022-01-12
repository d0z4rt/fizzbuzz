#!/bin/bash

docker run --rm -it --name fizzbuzz -v "$(pwd):/usr/local/workdir" fizzbuzz ./fizzbuzz.sh $1 $2