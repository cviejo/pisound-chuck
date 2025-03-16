#!/bin/sh -e

. /usr/local/pisound/scripts/common/common.sh

killall -q chuck || true

# hardcoded path, since this is run as root
mains=$(find "/home/patch/chuck" -name "*main.ck" -type f 2>/dev/null)

if [ -z "$mains" ]; then
	log "No main.ck files found in $HOME/chuck/"
	chuck -l &
	pid=$!
	log "chuck listener started"
	wait_process $pid
else
	pids=""

	for main in $mains; do
		log "Starting $main"
		chuck "$main" &
		pids="$pids $!"
		flash_leds 1
		sleep 0.2
	done

	for pid in $pids; do
		wait_process "$pid"
	done
fi
