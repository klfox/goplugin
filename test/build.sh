#!/bin/sh

BUILDHOME=/usr/build/goplugin$1

rm -rf $BUILDHOME
mkdir $BUILDHOME
go version > $BUILDHOME/version.txt

cd /tmp
pwd
git clone https://github.com/klfox/goplugin.git

cd goplugin/plugin
go build -buildmode=plugin -o $BUILDHOME/plugin.so
echo 'Plugin built'

cd ../client
go build -o $BUILDHOME/client
echo 'Client built'

$BUILDHOME/client -p $BUILDHOME/plugin.so


