#!/bin/sh

REFERENCE_CONTRACTS_URL=https://github.com/AntelopeIO/reference-contracts/archive/efff1254806aa2df68d06f5d5e4b5c122297a857.zip

curl --location --output ./reference-contracts.zip --silent $REFERENCE_CONTRACTS_URL
unzip ./reference-contracts.zip

cd ./reference-contracts-*/
./build.sh

cd ./build/
tar -c -f ../../contracts.tar ./contracts/*/*.abi ./contracts/*/*.wasm

rm --recursive ../../reference-contracts*
