#!/bin/sh -e

. /usr/local/pisound/scripts/common/common.sh

log "killall chuck instances..."
killall -q chuck || true

chuck -l &
chuckPID=$!

log "chuck started!"
flash_leds 1
sleep 0.3
flash_leds 1
sleep 0.3
flash_leds 1

wait_process $chuckPID
