#!/bin/bash

# Terminate already running bar instances
killall -9 waybar

# Wait until the processes have been shut down
while pgrep -u $UID -x waybar >/dev/null; do sleep 1; done

# Launch Polybar, using config location ~/.config/bspwm/polybar/config.ini
waybar &
