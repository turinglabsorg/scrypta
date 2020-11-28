#!/bin/bash

cd multi
mkdir build
docker build -t scrypta:multi .
docker run -d --name multi scrypta:multi
docker cp multi:/opt/scrypta/src/lyrad  ./build/lyrad
docker cp multi:/opt/scrypta/src/lyra-cli  ./build/lyra-cli
docker cp multi:/opt/scrypta/src/qt/lyra-qt  ./build/lyra-qt

mkdir scrypta-wallet
cd scrypta-wallet

mkdir DEBIAN
cd DEBIAN
touch control
echo "Package: scrypta-wallet
Version: 2.0.1
Section: custom
Priority: optional
Architecture: all
Essential: no
Installed-Size: 1024
Maintainer: Scrypta Foundation
Description: FullNode Wallet for Scrypta Blockchain" >> control

cd ..
mkdir usr
cp ../build usr
mv usr/build usr/bin

cd ..
dpkg-deb --build scrypta-wallet