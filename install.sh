#!/bin/sh -e

git clone https://github.com/ccrma/chuck.git chuck-git

sudo apt-get install bison flex libasound2-dev libsndfile1-dev libjack-jackd2-dev

cd chuck-git/src/

make linux-jack
# make linux-alsa

mkdir ~/.bin

cp chuck ~/.bin/chuck

echo "chuck module installed in ~/.bin/chuck"
