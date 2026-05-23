#!/bin/sh

CURRENT_WALL="$(basename "$(readlink -f ~/.local/share/wall.*)")"

killall -9 swaybg

WALLPAPER_DIR="${XDG_PICTURES_DIR:-$HOME/Imágenes}/walls/nord/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$CURRENT_WALL" | shuf -n 1)
EXT="$(basename "${WALLPAPER##*.}")"
ln -sf "$WALLPAPER" "$HOME/.local/share/wall.$EXT"
swaybg -i "$WALLPAPER"
