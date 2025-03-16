#!/bin/sh -e

. /usr/local/pisound/scripts/common/common.sh

# Kill any running chuck instances
killall -q chuck || true

# Find all main.ck files recursively in $HOME/chuck/
mains=$(find "$HOME/chuck" -name "*main.ck" -type f 2>/dev/null)

# No main files, start in server mode
if [ -z "$mains" ]; then
	log "No main.ck files found in $HOME/chuck/"
	chuck -l &
	chuckPID=$!
	log "chuck listener started"
	wait_process $chuckPID
else
	chuckIds=""

	# Print all main files found
	echo "Found the following main.ck files:"
	for main in $mains; do
		echo "- $main"
	done

	# Start each main.ck file with a delay between them
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
