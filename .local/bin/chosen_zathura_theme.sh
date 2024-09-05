#!/bin/sh

# Define the path to your Zathura configuration file
CONFIG_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/zathura/zathurarc"

# Define the lines for the light and dark themes
LIGHT_THEME="zathura-gruvbox-light-soft"
DARK_THEME="zathura-gruvbox-dark-soft"

# Escapar caracteres especiales para usar en sed
# Esto haría falta usarlo si y solo si utilizara la ruta completa en la variable
# Es decir si hicieramos: include ./ y el resto del comando
# Esto es porque sed interpretaria al punto y a la barra como caracteres especiales
# Y tendriamos que escapar toda la secuencia completa de posibles caracteres especiales
# En cuyo caso, ni siquiera vale la pena utilizar
# $, *, ^ o [], ya que los únicos que dan problema son . y /
#ESCAPED_LIGHT_THEME=$(printf '%s\n' "$LIGHT_THEME" | sed 's/[]\/$*.^[]/\\&/g')
#ESCAPED_DARK_THEME=$(printf '%s\n' "$DARK_THEME" | sed 's/[]\/$*.^[]/\\&/g')

claro() {
 if grep -q "$LIGHT_THEME" "$CONFIG_FILE"; then
    dunstify -u critical "El tema claro ya está activado"
    exit 1
  fi

  sed -i "/$DARK_THEME/d" "$CONFIG_FILE"  # Remove the dark theme line if it exists
  echo 'include ./'"$LIGHT_THEME" >> "$CONFIG_FILE"   # Append the light theme line
  dunstify -u normal -t 3600 "Cambiado al tema claro"
}

oscuro() {
 if grep -q "$DARK_THEME" "$CONFIG_FILE"; then
    dunstify -u critical "El tema oscuro ya está activado"
    exit 1
  fi

  sed -i "/$LIGHT_THEME/d" "$CONFIG_FILE"
  echo 'include ./'"$DARK_THEME" >> "$CONFIG_FILE"     # Append the dark theme line
  dunstify -u normal -t 3600 "Cambiado al tema oscuro"
}

case $(printf "Tema claro\\nTema oscuro" | dmenu -l 2 -i -p "Qué tema de zathura usar?") in
    "Tema claro") claro ;;
    "Tema oscuro") oscuro ;;
esac
