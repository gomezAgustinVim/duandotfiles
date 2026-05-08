#!/bin/sh
USUARIO=$(whoami)
DISPOSITIVO="Seagate-Backup"
DEST=/run/media/"$USUARIO"/"$DISPOSITIVO"/backup/
BACKUP_FILTER="${XDG_DATA_HOME:-$HOME/.local/share}/backup.filter"

# Size of file is = 0 bytes
if [ ! -s "$BACKUP_FILTER" ]; then
	cat <<EOF >"$BACKUP_FILTER"
# Exclude patterns
- *.tmp
- *.log
- *.git
- .thumbnails/
- .cache/
- .Rhistory
- .RData
- .vagrant/
- .vscode/
- target/
- bin/
- obj/
- .DS_Store
- node_modules/
EOF
fi

echo "Procediendo al backup nwn..."

# backup completo del sistema preservando atributos extendidos y ACLs
echo "Sincronizando archivos desde $HOME... nwn"
cd "$HOME" || return

rsync -aAXHv --delete --filter="merge $BACKUP_FILTER" \
	--exclude=docker-volumes --exclude=ISO \
	Descargas Documentos Imágenes Música Vídeos Escritorio Proyectos \
	~/.local/share/Obsidian "$DEST"

HOY=$(date +%c)
notify-send "Backup completo nwn" "$HOY"
echo "Último backup completo el $HOY" >"$DEST/backup.log"
