#!/bin/sh

LOWERVERSION=$1
UPPERVERSION=$2

echo "Execute build of Docker images"
docker build -f Dockerfile --build-arg IMAGEVERSION=$LOWERVERSION --build-arg GOVERSION=$LOWERVERSION . -t goplugin$LOWERVERSION
docker build -f Dockerfile --build-arg IMAGEVERSION=$UPPERVERSION --build-arg GOVERSION=$UPPERVERSION . -t goplugin$UPPERVERSION
docker build -f Dockerfile.run --build-arg LOWERVERSION=$LOWERVERSION --build-arg UPPERVERSION=$UPPERVERSION . -t gopluginrun

echo "Execute Go $LOWERVERSION build"
docker run --rm -v "$PWD"/build:/usr/build goplugin$LOWERVERSION

echo "Execute Go $UPPERVERSION build"
docker run --rm -v "$PWD"/build:/usr/build goplugin$UPPERVERSION

echo "Run Go plugin cross-version test"
docker run --rm -v "$PWD"/build:/usr/build gopluginrun
