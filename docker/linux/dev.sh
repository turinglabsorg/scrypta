#!/bin/bash

mkdir dev
cd dev

docker exec -d ubuntu18 cd /opt/scrypta/ && make clean && make -j16
docker cp ubuntu18:/opt/scrypta/src/lyrad  ./lyrad
docker cp ubuntu18:/opt/scrypta/src/lyra-cli  ./lyra-cli
docker cp ubuntu18:/opt/scrypta/src/qt/lyra-qt  ./lyra-qt