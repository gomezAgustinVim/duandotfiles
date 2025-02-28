#!/bin/sh

# Works with runit
# Parameters for RSYNC
# Name of USB drive
readonly NOMBRE="$1"
readonly COPIADOS="$2"
# My filter rules
readonly BACKUP_FILTER="$HOME/Documentos/backup.filter"
# File to store backup history
readonly BACKUP_HISTORY="$XDG_DATA_HOME/backup_history.txt"
readonly DAY=$(date +%d-%m-%H)
# USB PATH GOES HERE
readonly DESTINO="/run/media/utane/$NOMBRE/backup"
readonly DESTINO_FINAL="$DESTINO/$DAY"

# Append the current backup directory to the history file
echo "$DAY" >> "$BACKUP_HISTORY"

# Get the previous backup directory from the history file
DIRECTORIO_PREVIO=$(head -n 1 "$BACKUP_HISTORY")

if [ -n "$DIRECTORIO_PREVIO" ] && [ "$DIRECTORIO_PREVIO" != "$DAY" ]; then
  # The reason I do this is because I don't care about incr backups
  # It's not really necesary for my use case 
  mv "$DESTINO/$DIRECTORIO_PREVIO" "$DESTINO_FINAL"
  echo "$DAY" > "$BACKUP_HISTORY"
else
  # Create the backup directory for today
  mkdir -p "$DESTINO_FINAL"
fi

rsync -Pav --update --delete-after --filter="merge $BACKUP_FILTER" "$COPIADOS" "$DESTINO_FINAL"

 if [ $? -eq 0 ]; then
    notify-send "Backup completado" "Los archivos se han copiado a $DESTINO_FINAL"
  else
    notify-send "Error en el backup" "Hubo un problema al copiar los archivos a $DESTINO_FINAL"
  fi

