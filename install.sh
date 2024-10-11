#!/bin/sh -e

if [ "$CHUCK_BUILD" = "1" ]; then
	# git clone https://github.com/ccrma/chuck.git chuck-git
	#
	# apt-get install bison flex libasound2-dev libsndfile1-dev libjack-jackd2-dev
	#
	# cd chuck-git/src/
	#
	# make linux-jack

	cp ~/.bin/chuck /usr/local/bin
else
	apt-get update
	apt-get install chuck
fi

echo "chuck module installed"
