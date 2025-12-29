#!/bin/sh

# Necesita rofi para andar

set -e # abort on error

# Get distinct current users
USUARIOS=$(users | tr ' ' '\n' | sort -u)

# Si solo hay un usuario, usarlo automáticamente
if [ $(echo "$USUARIOS" | wc -l) -eq 1 ]; then
    USUARIO="$USUARIOS"
else
    # Si hay múltiples usuarios, mostrar menú para seleccionar
    echo "No especificado usuario"
    echo "Seleccione un usuario:"
    USUARIO=$(echo "$USUARIOS" | rofi -dmenu -p 'Selecciona un usuario') || exit 0
fi

# mounted for one user
LIST=$(ls /run/media/$USUARIO)

# Si no hay dispositivos
if [ -z "$LIST" ]; then
    echo "No hay dispositivos montados para $USUARIO"
else
    # rofi menu for list
    MENU=$(echo "$LIST" | rofi -dmenu -p 'Dispositivo USB')

DEVICE_NAME=$(echo "$MENU")
MOUNT_POINT="/run/media/$USUARIO/$DEVICE_NAME"

# unmount usb
sudo -A umount -l $MOUNT_POINT
fi

# publico montado?
if [ $(find $HOME/Publico -maxdepth 1 ! -name "Publico" | wc -l) -gt 0 ]; then
    # unmount public
    read -p "Desmontar carpeta publico tambien? s/n" resp
    case "$resp" in
        [sS]*)
            sudo -A umount -l $HOME/Publico
            ;;
            [nN])
                exit 0 ;;
                *)
                    echo "Respuesta invalida"
                    exit 1
                    ;;
    esac
fi
