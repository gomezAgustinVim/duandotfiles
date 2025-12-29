#!/bin/sh

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

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

# Si no hay dispositivos
if [ -z "$LIST" ]; then
    echo "${RED}ERROR:${NC} No hay dispositivos montados para ${GREEN}$USUARIO${NC}\n"
else
    LIST=$(ls /run/media/$USUARIO)

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
    while true; do
    read -p "Desmontar carpeta publico tambien? s/n: " resp
    case "$resp" in
        [sS]*)
            echo "${BLUE}Desmontando $HOME/Publico...${NC}"
                if sudo -A umount -l "$HOME/Publico"; then
                    echo "${GREEN}✓ Publico desmontado${NC}"
                else
                    echo "${RED}✗ Error desmontando publico${NC}"
                fi
                break
            ;;
            [nN])
                echo "${BLUE}Continuando sin desmontar Publico${NC}"
                break
                ;;
                *)
                    echo "${RED}Respuesta invalida ${BLUE}ingrese s o n NWN${NC}"
                    ;;
    esac
done
else
    echo "${RED}ERROR:${NC} No hay carpeta publico montada"
fi
