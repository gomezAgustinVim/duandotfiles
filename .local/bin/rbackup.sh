#!/bin/sh

# this is a work in progress
readonly RSYNC_DEFAULTS="-Pavz"
readonly NOMBRE="$1"
readonly DESTINO=/run/media/utane/$NOMBRE

case "$DESTINO" in
    */Descargas|*/Documentos|*/Imagenes|*/Musica|*/Escritorio|*/Videos)
        ;;
    *)
        mkdir -p "$DESTINO/Descargas" "$DESTINO/Documentos" "$DESTINO/Imagenes" "$DESTINO/Musica" "$DESTINO/Escritorio" "$DESTINO/Videos"
        ;;
esac

backup_files() {
    # rsync $RSYNC_DEFAULTS --delete --exclude={'Series','Mega-Programacion','node_modules','.angular','.vscode','.git'} "$XDG_DATA_HOME/vimwiki" "$HOME/Descargas" "$HOME/Documentos" "$HOME/Imagenes" --exclude={'Emulation','ISO','Images','Cosas-Windows'} "$HOME/Escritorio" "$DESTINO"
    rsync $RSYNC_DEFAULTS --delete --exclude-from='/home/utane/Documentos/excluir.txt' "$XDG_DATA_HOME/vimwiki" "$HOME/Descargas" "$HOME/Documentos" "$HOME/Imagenes" "$HOME/Escritorio" "$HOME/Videos" "$DESTINO"
    notify-send "Los archivos se terminaron de mandar a $DESTINO"
}

backup_files
