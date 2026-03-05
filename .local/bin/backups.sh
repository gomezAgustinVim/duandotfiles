#!/bin/sh
USUARIO=$(whoami)
DISPOSITIVO="Seagate-Backup"
RUTA=/run/media/"$USUARIO"/"$DISPOSITIVO"/backup
CARP=$(ls -1 "$RUTA" 2>/dev/null)
HOY=$(date +%A-%d)
BACKUP_FILTER="${XDG_DATA_HOME:-$HOME/.local/share}/backup.filter"

# [[ ! -f "$BACKUP_FILTER" ]] && touch "$BACKUP_FILTER"

# Size of file is = 0 bytes
if [ ! -s "$BACKUP_FILTER" ]; then
    cat <<EOF > "$BACKUP_FILTER"
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

if [ "$CARP" = "$HOY" ]; then
    echo "Procediendo al backup nwn"
else
    mv "$RUTA/$CARP" "$RUTA/$HOY"
fi

DEST="$RUTA"/"$CARP"

# backup completo del sistema preservando atributos extendidos y ACLs
echo "Sincronizando archivos desde $HOME... nwn"
cd "$HOME"

rsync -aAXHv --delete --filter="merge $BACKUP_FILTER" \
    --exclude=docker-volumes --exclude=ISO \
    Descargas Documentos Imagenes Musica Videos Escritorio "$DEST/"
notify-send "Backup completo" "Terminó el backup de todo nwn"
