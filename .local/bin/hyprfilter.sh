#!/bin/sh
# Put a certain temperature when it gets dark

set -e

SUNSET=1900

# Get current time in HHMM format
CURRENT_TIME=$(date +%H%M)

# Check if current time is past sunset
if [ "$CURRENT_TIME" -ge "$SUNSET" ]; then
    hyprctl hyprsunset temperature 3500
fi
