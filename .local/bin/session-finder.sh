#!/bin/sh

# Get tmux sessions, handling both active and inactive sessions
sessions=$(tmux list-sessions 2>/dev/null)

if [ -z "$sessions" ]; then
    # No sessions found
    notify-send "Tmux Session finder" "Sin sesiones de tmux"
    exit 1
fi

selection=$(echo "$sessions" | awk -F : '{print $1}' | rofi -dmenu -p "Seleccionar sesión de tmux")

# Check if selection was made and is not empty
if [ -z "$selection" ]; then
    exit 0
fi

tmux attach -t $selection
