#!/bin/usr/bin/env bash

# Define the path to your Zathura configuration file
CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/zathura/zathura-theme"

# Define the lines for the light and dark themes
LIGHT_THEME="zathura-gruvbox-light"
DARK_THEME="zathura-gruvbox-dark"

# Escapar caracteres especiales para usar en sed
# Esto haría falta usarlo si y solo si utilizara la ruta completa en la variable
# Es decir si hicieramos: include ./ y el resto del comando
# Esto es porque sed interpretaria al punto y a la barra como caracteres especiales
# Y tendriamos que escapar toda la secuencia completa de posibles caracteres especiales
# En cuyo caso, ni siquiera vale la pena utilizar
# $, *, ^ o [], ya que los únicos que dan problema son . y /
#ESCAPED_LIGHT_THEME=$(printf '%s\n' "$LIGHT_THEME" | sed 's/[]\/$*.^[]/\\&/g')
#ESCAPED_DARK_THEME=$(printf '%s\n' "$DARK_THEME" | sed 's/[]\/$*.^[]/\\&/g')

if grep -q "$LIGHT_THEME" "$CONFIG_FILE"; then
    sed -i "/$LIGHT_THEME/d" "$CONFIG_FILE"
    echo 'include ./'"$DARK_THEME" >>"$CONFIG_FILE"
    dunstify -u normal "Cambiado al tema oscuro"
else
    sed -i "/$DARK_THEME/d" "$CONFIG_FILE"
    echo 'include ./'"$LIGHT_THEME" >>"$CONFIG_FILE"
    dunstify -u normal "Cambiado al tema claro"
fi
