#!/bin/bash

cd debian
mkdir build
docker build -t scrypta:debian .
docker run -d --name debian -p 42222:42222 -p 42223:42223 scrypta:debian
docker cp debian:/opt/scrypta/src/lyrad  ./build/lyrad
docker cp debian:/opt/scrypta/src/lyra-cli  ./build/lyra-cli
docker cp debian:/opt/scrypta/src/qt/lyra-qt  ./build/lyra-qt