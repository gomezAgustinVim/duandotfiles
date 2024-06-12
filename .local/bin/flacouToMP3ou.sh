#!/bin/sh

# El script que intentaba hacer yo
# find -maxdepth 2 -name '*.flac' | xargs -I{} ffmpeg -i {} -b:a 320k "${ {}%.* }".mp3
# find -maxdepth 2 -name '*.flac.mp3' | xargs -I{} basename {} | sed -s s/.flac//
# find -maxdepth 2 -name '*.flac' -exec rm {} +

echo "Desea convertir todos los directorios y subdirectorios a mp3?"
read -p "'y' para sí, 'n' para no: " rta
if [[ $rta = 'y' ]]; then
# El que encontré en internet
    find . -type f -name '*.flac' -print -exec sh -c 'i="{}"; ffmpeg -i "$i" -y -b:a 320k "${i%.flac}".mp3 && rm -f "$i"' \;
    notify-send "Conversion de flac a mp3 completada nwn"
elif [[ $rta = 'n' ]]; then
    echo "Chau"
    exit 1
fi
