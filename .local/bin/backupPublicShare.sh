#!/bin/sh

# Parameters for RSYNC
COPIADOS="$@"

# My filter rules
BACKUP_FILTER="$HOME/Documentos/backupPublic.filter"

# File to store backup history
FECHA_HORA=$(date +%y%d%m-%H-%M)
# USB PATH GOES HERE
BACKUPS="$HOME/Publico/backup"
DESTINO="$BACKUPS/$FECHA_HORA"

# Backup history file
BACKUP_HISTORY_FILE="/tmp/backup_history.txt"

cleanup() {
    echo "Cleaning up..."
    rm -f $BACKUP_HISTORY_FILE
    exit
}

# Clean up the backup history file
trap cleanup 1 2 3 6 15 9

# Count directories in BACKUPS
DIR_COUNT=$(find "$BACKUPS" -maxdepth 1 -type d | wc -l)
# Subtract 1 for the BACKUPS directory itself
DIR_COUNT=$((DIR_COUNT - 1))

if [ $DIR_COUNT -gt 1 ]; then
    notify-send "Hay más de un directorio en $BACKUPS." "Sólo puede haber uno"
    exit 1
else
    # Get the oldest backup directory
    # ls -t1r "$BACKUPS" | head -n 1 > $BACKUP_HISTORY_FILE
    ls "$BACKUPS" > $BACKUP_HISTORY_FILE
    ORIGEN=$(cat $BACKUP_HISTORY_FILE)
fi

if [ -z "$ORIGEN" ]; then
    notify-send "Aun no hay un directorio creado en $BACKUPS." "Creando..."
    mkdir -p "$DESTINO"
    notify-send "Directorio creado con éxito nwn"
fi

# Append the current backup directory to the history file
echo "$FECHA_HORA" >> $BACKUP_HISTORY_FILE

# Get the previous backup directory from the history file
ACTUAL=$(tail -n 1 $BACKUP_HISTORY_FILE)

# The reason I do this is because I don't care about incr backups
# It's not really necesary for my use case
mv "$BACKUPS/$ORIGEN" "$DESTINO"

rsync -Pav -z --update --delete-after --filter="merge $BACKUP_FILTER" $COPIADOS $DESTINO

if [ $? -eq 0 ]; then
    notify-send "Backup completado" "Los archivos se han copiado a $DESTINO"
else
    notify-send "Error en el backup" "Hubo un problema al copiar los archivos a $DESTINO"
fi
