#!/bin/sh

# Necesita rofi para andar

# OPTS

LIST_MODE=false
SPECIFIED_USER=''

set -e # abort on error

while getopts 'lu:' opt; do
    case $opt in
        l)
            LIST_MODE=true
            ;;
        u)
            SPECIFIED_USER="$OPTARG"
            ;;
        *)
            echo "Uso: $0 [-l] [-u <user>]"
            echo "  -l lista los dispositivos conectados"
            echo "  -u USER especifica los dispositivos conectados de un usuario"
            ;;
    esac
done

# get distinct users if no argument is specified
# give a warning that you have to specify a user
if [ -n "$SPECIFIED_USER" ]; then
    # Use specified user
    if id "$SPECIFIED_USER" >/dev/null 2>&1; then
        USUARIO="$SPECIFIED_USER"
    else
        echo "Error: Usuario '$SPECIFIED_USER' no existe"
    fi
else
    # Get distinct current users
    USUARIOS=$(users | tr ' ' '\n' | sort -u)

  # Si solo hay un usuario, usarlo automáticamente
    if [ $(echo "$USUARIOS" | wc -l) -eq 1 ]; then
        USUARIO="$USUARIOS"
    else
        # Si hay múltiples usuarios, mostrar menú para seleccionar
        echo "No especificado usuario"
        echo "Seleccione un usuario:"
        USUARIO=$(echo "$USUARIOS" | rofi -dmenu -p 'Selecciona un usuario')

        if [ -z "$USUARIO" ]; then
            exit 0
        fi
    fi
fi

# mounted for one user
LIST=$(ls /run/media/$USUARIO)

# Si no hay dispositivos
if [ -z "$LIST" ]; then
    echo "No hay dispositivos montados para $USUARIO"
    exit 0
fi

# rofi menu for list
MENU=$(echo "$LIST" | rofi -dmenu -p 'Dispositivo USB')

if $LIST_MODE; then
    echo "Dispostivo: $MENU"
    echo "Se encuentra en /run/media/$USUARIO"
    exit 0
fi

DEVICE_NAME=$(echo "$MENU")
MOUNT_POINT="/run/media/$USUARIO/$DEVICE_NAME"

# unmount usb
umount $MOUNT_POINT
