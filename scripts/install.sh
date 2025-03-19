#!/bin/sh -e

src="$HOME/.local/src"
chuginDir="${CHUGIN_DIR:-/usr/local}"

# dummy change
# dummy change

mkdir -p "$src"

clone() {
	repo="$1"
	name=$(basename "$repo")
	if [ ! -d "$src/$name" ]; then
		git clone "https://github.com/$repo.git" "$src/$name"
	fi
}

if [ "$CHUCK_SKIP_INSTALL" = "1" ]; then
	echo "chuck module installed (skipped chuck and chugin installation)"
	exit 0
fi

if [ "$CHUCK_BUILD" = "1" ]; then
	clone "ccrma/chuck"
	apt-get install bison flex libasound2-dev libsndfile1-dev libjack-jackd2-dev
	cd "$src/chuck/src/"
	make linux-jack
	cp chuck /usr/local/bin
else
	apt-get update
	apt-get install chuck
fi

if [ "$CHUCK_CHUGINS" = "1" ]; then
	clone "ccrma/chugins"
	cd "$src/chugins"
	git submodule update --init --recursive
	cd "$src/chugins"
	make linux
	make install DESTDIR="$chuginDir"
fi

if [ "$CHUCK_MI" = "1" ]; then
	clone "cviejo/chugable-instruments"
	cd "$src/chugable-instruments"
	git submodule update --init --recursive
	make linux
	make install DEST="$chuginDir/lib/chuck"
fi

echo "chuck module installed"
