#!/bin/sh

HOUR=18

while true; do
TIME=$(date '+%H')

    if [ "$TIME" -ge "$HOUR" ]; then
        hyprctl hyprsunset temperature 3500
        notify-send "Luz Azul" "Activada (3500K)"
        exit 0
    else
        sleep 600  # chequea una hora despues
    fi
done
