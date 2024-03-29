#!/bin/bash

set -e

docker build -t firefox .

docker run -ti --rm \
   -e DISPLAY=$DISPLAY \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   firefox
