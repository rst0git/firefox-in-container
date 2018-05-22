#!/bin/bash
echo "Build image..."
docker build -t firefox .

echo "Start..."
docker run -ti --rm \
   -e DISPLAY=$DISPLAY \
   -v /tmp/.X11-unix:/tmp/.X11-unix \
   firefox