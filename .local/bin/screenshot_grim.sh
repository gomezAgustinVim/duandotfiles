#!/bin/sh

# El siguiente script requiere rofi, hyprland, jq, grim y slurp
# Toma una captura del escritorio siguiendo varias opciones

# monitor = hyprctl monitors | grep "ID 0" | cut -d ' ' -f2
output="$(date '+%y%d%m-%H%M-%S').png"

case "$(printf "area seleccionada\\nventana actual\\npantalla completa\\ncopiar area seleccionada\\ncopiar ventana actual\\ncopiar pantalla completa" | rofi -dmenu -l 6 -i -p "Tipo de selección")" in
    "area seleccionada") grim -g "$(slurp)" $(xdg-user-dir PICTURES)/pic-sel-"${output}" ;;
    "ventana actual") sleep 0.3 && hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - $(xdg-user-dir PICTURES)/pic-win-"${output}" ;;
    "pantalla completa") grim $(xdg-user-dir PICTURES)/pic-full-"${output}" ;;
    "copiar area seleccionada") grim -g "$(slurp)" - | wl-copy ;;
    "copiar ventana actual") sleep 0.3 && hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"' | grim -g - - | wl-copy ;;
    "copiar pantalla completa") grim - | wl-copy ;;
esac
