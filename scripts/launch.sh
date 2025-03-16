#!/bin/sh -e

. /usr/local/pisound/scripts/common/common.sh

killall -q chuck || true

mains=$(find "$HOME/chuck" -name "*main.ck" -type f 2>/dev/null)

if [ -z "$mains" ]; then
	log "No main.ck files found in $HOME/chuck/"
	chuck -l &
	chuckPID=$!
	log "chuck listener started"
	wait_process $chuckPID
else
	chuckIds=""

	for main in $mains; do
		log "Starting $main"
		chuck "$main" &
		chuckIds="$chuckIds $!"
		flash_leds 1
		sleep 0.2
	done

	# Wait for all chuck processes to finish
	for pid in $chuckIds; do
		wait_process "$pid"
	done
fi
