#!/bin/sh -e

src="$HOME/.local/src"

mkdir -p "$src"

if [ "$CHUCK_SKIP_INSTALL" = "1" ]; then
	echo "chuck module installed (skipped chuck and chugin installation)"
	exit 0
fi

if [ "$CHUCK_BUILD" = "1" ]; then
	if [ ! -d "$src/chuck" ]; then
		git clone https://github.com/ccrma/chuck.git "$src/chuck"
	fi
	apt-get install bison flex libasound2-dev libsndfile1-dev libjack-jackd2-dev
	cd "$src/chuck/src/"
	make linux-jack
	cp chuck /usr/local/bin
else
	apt-get update
	apt-get install chuck
fi

if [ "$CHUCK_CHUGINS" = "1" ]; then
	git clone --recurse-submodules https://github.com/ccrma/chugins.git "$src/chugins"
	cd "$src/chugins"
	make linux
	make install
fi

echo "chuck module installed"
