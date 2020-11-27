#!/bin/bash

rm -rf dev
mkdir dev
cd dev

docker exec -it -w /opt/scrypta/ multi git pull
docker exec -it -w /opt/scrypta/ multi make clean
docker exec -it -w /opt/scrypta/ multi make -j16

docker cp multi:/opt/scrypta/src/lyrad  ./lyrad
docker cp multi:/opt/scrypta/src/lyra-cli  ./lyra-cli
docker cp multi:/opt/scrypta/src/qt/lyra-qt  ./lyra-qt

sleep 2
./lyra-qt