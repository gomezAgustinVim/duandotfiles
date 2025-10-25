#!/bin/sh

HOUR=18
MORNING=6

while true; do
TIME=$(date '+%H')

    if [ "$TIME" -ge "$HOUR" ] || [ "$TIME"  -lt "$MORNING" ]; then
        hyprctl hyprsunset temperature 3500
    else
        hyprctl hyprsunset identity  # temperatura normal
    fi

    sleep 600  # chequea 10 minutos despues
done
