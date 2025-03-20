#!/usr/bin/bash

# Works with runit
# Parameters for RSYNC
# Name of USB drive
NOMBRE="$1"
COPIADOS="${@:2}"
# My filter rules
BACKUP_FILTER="$HOME/Documentos/backup.filter"
# File to store backup history
DAY=$(date +%y%d%m-%H-%M)
# USB PATH GOES HERE
DESTINO="/run/media/utane/$NOMBRE/backup"
DESTINO_FINAL="$DESTINO/$DAY"

# A better handle of the backup history file
ls -t1r $DESTINO | head -n 1 > /tmp/backup_history.txt
BACKUP_HISTORY=$(cat /tmp/backup_history.txt)

if [ -z "$BACKUP_HISTORY" ]; then
    notify-send "Aun no hay un directorio creado en $DESTINO." "Creando..."
    mkdir -p $DESTINO_FINAL
    notify-send "Directorio creado con éxito nwn"
fi

# Append the current backup directory to the history file
echo "$DAY" >> "$BACKUP_HISTORY"

# Get the previous backup directory from the history file
DIRECTORIO_PREVIO=$(head -n 1 "$BACKUP_HISTORY")

if [ -n "$DIRECTORIO_PREVIO" ] && [ "$DIRECTORIO_PREVIO" != "$DAY" ]; then
    # The reason I do this is because I don't care about incr backups
    # It's not really necesary for my use case
    mv "$DESTINO/$DIRECTORIO_PREVIO" "$DESTINO_FINAL"
fi

rsync -Pav --update --delete-after --filter="merge $BACKUP_FILTER" $COPIADOS "$DESTINO_FINAL"
rm /tmp/backup_history.txt

if [ $? -eq 0 ]; then
    notify-send "Backup completado" "Los archivos se han copiado a $DESTINO_FINAL"
else
    notify-send "Error en el backup" "Hubo un problema al copiar los archivos a $DESTINO_FINAL"
fi
