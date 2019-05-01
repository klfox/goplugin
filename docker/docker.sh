#!/bin/sh

echo "Execute build of Docker images"
docker build -f Dockerfile111 . -t goplugin111
docker build -f Dockerfile112 . -t goplugin112
docker build -f Dockerfile.run . -t gopluginrun

echo "Execute Go 1.11 build"
docker run --rm -v "$PWD"/build:/usr/build goplugin111

echo "Execute Go 1.12 build"
docker run --rm -v "$PWD"/build:/usr/build goplugin112

echo "Run Go plugin cross-version test"
docker run --rm -v "$PWD"/build:/usr/build gopluginrun
