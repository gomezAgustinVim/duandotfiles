#!/bin/sh

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# Launch Polybar, using config location ~/.config/bspwm/polybar/config.ini
polybar --config=~/.config/bspwm/polybar/config.ini cliffmain 2>&1 | tee -a /tmp/polybar.log & disown
