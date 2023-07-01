#!/bin/bash
set -e

cd /pico
git clone https://github.com/raspberrypi/pico-sdk.git --branch master
cd /pico/pico-sdk
git submodule update --init
git pull
git submodule update

cd /pico
git clone https://github.com/raspberrypi/pico-examples.git --branch master
cd /pico/pico-examples
mkdir build && cd build


