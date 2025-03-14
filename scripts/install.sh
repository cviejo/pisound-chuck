#!/bin/sh -e

# TODO: clone the repos in better locations and/or clean them up after installation

if [ "$CHUCK_SKIP_INSTALL" = "1" ]; then
	echo "chuck module installed (skipped)"
	exit 0
fi

if [ "$CHUCK_BUILD" = "1" ]; then
	if [ ! -d "chuck-git" ]; then
		git clone https://github.com/ccrma/chuck.git chuck-git
	fi
	apt-get install bison flex libasound2-dev libsndfile1-dev libjack-jackd2-dev
	cd chuck-git/src/
	make linux-jack
	cp chuck /usr/local/bin
else
	apt-get update
	apt-get install chuck
fi

if [ "$CHUCK_CHUGINS" = "1" ]; then
	git clone --recurse-submodules https://github.com/ccrma/chugins.git
	cd chugins
	make linux
	make install
fi

echo "chuck module installed"
