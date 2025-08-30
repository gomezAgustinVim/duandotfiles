#!/bin/usr/bin/env bash

echo "Desea convertir todos los directorios y subdirectorios a mp3?"
read -p "'y' para sí, 'n' para no: " rta
if [[ $rta = 'y' ]]; then
    # El que encontré en internet
    find . -type f -name '*.flac' -print -exec sh -c 'i="{}"; ffmpeg -i "$i" -y -b:a 320k "${i%.flac}".mp3 && rm -f "$i"' \;
    notify-send "Conversion de flac a mp3 completada nwn"
elif [[ $rta = 'n' ]]; then
    echo "Chau"
    exit 0
fi
