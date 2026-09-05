#!/bin/sh

xbg() {
	# Location of link to wallpaper link.
	bgloc="${XDG_DATA_HOME:-$HOME/.local/share}/bg"

	trueloc="$(readlink -f "$1")" &&
		case "$(file --mime-type -b "$trueloc")" in
		image/*) ln -sf "$(readlink -f "$1")" "$bgloc" && notify-send -i "$bgloc" "Changing wallpaper..." ;;
		inode/directory) ln -sf "$(find "$trueloc" -iregex '.*.\(jpg\|jpeg\|png\|gif\)' -type f | shuf -n 1)" "$bgloc" && notify-send -i "$bgloc" "Random Wallpaper chosen." ;;
		*)
			notify-send "❌ Error" "No es directorio ni tipo de imagen validos"
			exit 1
			;;
		esac

	xwallpaper --stretch "$bgloc"
}

if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
	xbg "$@"
fi

bgloc="${XDG_DATA_HOME:-$HOME/.local/share}/bg"
mkdir -p "$bgloc"
current_wall="$(basename "$(readlink -f "$bgloc"/wall.png)")"
trueloc="$(readlink -f "$1")"

case "$(file --mime-type -b "$trueloc")" in
image/*)
	ln -sf "$trueloc" "$bgloc"/wall.png
	notify-send -i "$bgloc/wall.png" "Cambiando wallpaper nwn..."
	;;
inode/directory)
	wallpaper="$(find "$trueloc" -iregex '.*\.\(jpg\|jpeg\|png\|gif\)$' -type f ! -name "$current_wall" | shuf -n 1)"
	ln -sf "$wallpaper" "$bgloc"/wall.png
	notify-send -i "$bgloc/wall.png" "Elegiste wallpaper nwn..."
	;;
*)
	notify-send "❌ Error" "No es directorio ni tipo de imagen validos"
	# Con exit 1 la salida se queja en yazi y me dice que setbg sigue corriendo
	exit 1
	;;
esac

pkill -x swaybg
swaybg -m stretch -i "$bgloc/wall.png" &
