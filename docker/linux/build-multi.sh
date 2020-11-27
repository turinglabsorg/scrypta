#!/bin/bash

cd multi
mkdir build
docker build -t scrypta:multi .
docker run -d --name multi scrypta:multi
docker cp multi:/opt/scrypta/src/lyrad  ./build/lyrad
docker cp multi:/opt/scrypta/src/lyra-cli  ./build/lyra-cli
docker cp multi:/opt/scrypta/src/qt/lyra-qt  ./build/lyra-qt