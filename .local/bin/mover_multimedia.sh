#!/bin/sh

IMAGEN=$HOME/Imagenes
VIDEO=$HOME/Videos

# Mueve las imagenes a donde van las imagenes
mov_imagen() {
    for i in *.{jpg,png,webp}; do
        [ -e "$i" ] && mv "$i" $IMAGEN 2>/dev/null
    done
    notify-send "Imagenes movidas a $IMAGEN con éxito"
}

# Mueve los videos a donde tienen que ir
mov_video() {
    for i in *.{avi,mp4,webm}; do
        [ -e "$i" ] && mv "$i" $VIDEO 2>/dev/null
    done
    notify-send "Videos movidos a $VIDEO con éxito"
}

ask() {
    choice=$(printf "Imagenes\\nVideos" | rofi -dmenu -i -p "Qué desea mover?")
    case "$choice" in
        Imagenes) mov_imagen ;;
        Videos) mov_video ;;
    esac
}

ask
