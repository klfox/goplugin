#!/bin/sh

LOWERVERSION=$1
UPPERVERSION=$2

LOWERTAG=goplugin$LOWERVERSION
UPPERTAG=goplugin$UPPERVERSION

echo "Execute build of Docker images"
docker build -f Dockerfile --build-arg IMAGEVERSION=$LOWERVERSION --build-arg GOVERSION=$LOWERVERSION . -t $LOWERTAG
docker build -f Dockerfile --build-arg IMAGEVERSION=$UPPERVERSION --build-arg GOVERSION=$UPPERVERSION . -t $UPPERTAG
docker build -f Dockerfile.run --build-arg LOWERVERSION=$LOWERVERSION --build-arg UPPERVERSION=$UPPERVERSION . -t gopluginrun

echo "Execute Go $LOWERVERSION build"
docker run --rm -v "$PWD"/build:/usr/build $LOWERTAG

echo "Execute Go $UPPERVERSION build"
docker run --rm -v "$PWD"/build:/usr/build $UPPERTAG

echo "Run Go plugin cross-version test"
docker run --rm -v "$PWD"/build:/usr/build gopluginrun

# Cleanup
docker rmi $LOWERTAG $UPPERTAG gopluginrun 1>/dev/null
