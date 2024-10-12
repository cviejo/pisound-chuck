#!/bin/sh -e

. /usr/local/pisound/scripts/common/common.sh

log "Killing all chuck instances!"
killall chuck 2>/dev/null

chuck -l &
chuckPID=$!

log "chuck started!"
flash_leds 1
sleep 0.3
flash_leds 1
sleep 0.3
flash_leds 1

wait_process $chuckPID
