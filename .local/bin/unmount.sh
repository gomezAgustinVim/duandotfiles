#!/bin/sh

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m'

# Necesita rofi para andar

set -e # abort on error

# Get current user
USUARIO=$(whoami)

# mounted for one user
LIST=$(ls /run/media/$USUARIO) > /dev/null 2>&1 || continue

# Si no hay dispositivos
if [ -z "$LIST" ]; then
    echo "${RED}ERROR:${NC} No hay dispositivos montados para ${GREEN}$USUARIO${NC}\n"
else
    # rofi menu for list
    MENU=$(echo "$LIST" | rofi -dmenu -p 'Dispositivo USB')

    DEVICE_NAME=$(echo "$MENU")
    MOUNT_POINT="/run/media/$USUARIO/$DEVICE_NAME"

    while true; do
    read -p "¿Desea desmontar el dispositivo USB $DEVICE_NAME? s/n: " resp
    case "$resp" in
        [sS])
            echo "${BLUE}Desmontando$MOUNT_POINT...${NC}"
            sudo -A umount -l $MOUNT_POINT
            echo "${GREEN}EXITO:${NC} Dispositivo USB desmontado con éxito"
            break
            ;;
        [nN])
            echo "${BLUE}Continuando sin desmontar dispositivo USB${NC}"
            break
            ;;
        *)
            echo "${RED}Respuesta invalida ${BLUE}ingrese s o n NWN${NC}"
            ;;
        esac
    done
fi

# publico montado?
if [ $(find $HOME/Publico -maxdepth 1 ! -name "Publico" | wc -l) -gt 0 ]; then
    # unmount public
    while true; do
    read -p "Desmontar carpeta publico tambien? s/n: " resp
    case "$resp" in
        [sS])
            echo "${BLUE}Desmontando $HOME/Publico...${NC}"
            sudo -A umount -l "$HOME/Publico"
            echo "${GREEN}✓ Publico desmontado${NC}"
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
