#!/bin/usr/bin/env bash

# Rofi menu options
OPTIONS=("󰌌  Activar (3500K)" "󰌍  Desactivar" "󰤄  Suspender por...")

# Show Rofi menu
CHOICE=$(printf "%s\n" "${OPTIONS[@]}" | rofi -dmenu -p "Temperatura nocturna:")

case "$CHOICE" in
    "󰌌  Activar (3500K)")
        hyprctl hyprsunset temperature 3500
        notify-send "Luz azul" "Activada (3500K)"
        ;;
    "󰌍  Desactivar")
        hyprctl hyprsunset identity
        notify-send "Luz azul" "Desactivada"
        ;;
    "󰤄  Suspender por...")
        # Rofi input for suspend duration (minutes)
        DURATION=$(rofi -dmenu -p "Suspender por (minutos):")

        if [[ "$DURATION" =~ ^[0-9]+$ ]]; then
            hyprctl hyprsunset identity
            notify-send "Luz azul" "Deshabilitada por $DURATION minutos"

            # Re-enable after duration
            sleep "${DURATION}m"
            hyprctl hyprsunset temperature 3500
            notify-send "Luz Azul" "Reactivada (3500K)"
        else
            notify-send "Error" "Duracion invalida"
        fi
        ;;
esac
