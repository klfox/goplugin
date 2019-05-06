#!/bin/sh

LOWERVERSION=$1
UPPERVERSION=$2

echo "Client: $LOWERVERSION, Plugin $LOWERVERSION"
/usr/build/goplugin$LOWERVERSION/client -p /usr/build/goplugin$LOWERVERSION/plugin.so

echo "Client: $UPPERVERSION, Plugin $UPPERVERSION"
/usr/build/goplugin$UPPERVERSION/client -p /usr/build/goplugin$UPPERVERSION/plugin.so

echo "Client: $LOWERVERSION, Plugin $UPPERVERSION"
/usr/build/goplugin$LOWERVERSION/client -p /usr/build/goplugin$UPPERVERSION/plugin.so

echo "Client: $UPPERVERSION, Plugin $LOWERVERSION"
/usr/build/goplugin$UPPERVERSION/client -p /usr/build/goplugin$LOWERVERSION/plugin.so