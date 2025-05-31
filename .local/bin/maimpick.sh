#!/bin/sh

# This is bound to Shift+PrintScreen by default, requires maim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. scrotcucks on suicidewatch right now.

# variables
output="$(date '+%y%m%d-%H%M-%S').png"
xclip_cmd="xclip -sel clip -t image/png"

case "$(printf "area seleccionada\\nventana actual\\npantalla completa\\narea seleccionada (copiar)\\nventana actual (copiar)\\npantalla completa (copiar)" | rofi -dmenu -l 6 -i -p "Tipo de selección")" in
    "area seleccionada") maim -s -u -o pic-selected-"${output}" ;;
    "ventana actual") maim -u -q -d 0.2 -o -i "$(xdotool getactivewindow)" pic-window-"${output}" ;;
    "pantalla completa") maim -u -q -d 0.2 -o pic-full-"${output}" ;;
    "area seleccionada (copiar)") maim -s -u -o | ${xclip_cmd} ;;
    "ventana actual (copiar)") maim -u -q -d 0.2 -o -i "$(xdotool getactivewindow)" | ${xclip_cmd} ;;
    "pantalla completa (copiar)") maim -u -q -d 0.2 -o | ${xclip_cmd} ;;
esac
