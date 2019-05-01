#!/bin/sh

echo "Client: 1.11, Plugin 1.11"
/usr/build/goplugin111/client -p /usr/build/goplugin111/plugin.so

echo "Client: 1.12, Plugin 1.12"
/usr/build/goplugin112/client -p /usr/build/goplugin112/plugin.so

echo "Client: 1.11, Plugin 1.12"
/usr/build/goplugin111/client -p /usr/build/goplugin112/plugin.so

echo "Client: 1.12, Plugin 1.11"
/usr/build/goplugin112/client -p /usr/build/goplugin111/plugin.so