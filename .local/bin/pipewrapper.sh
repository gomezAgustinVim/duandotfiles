#!/bin/sh
# Function to check if a service is running
is_running() {
    pgrep -x "$1" > /dev/null 2>&1
}

# Function to start a service if it is not running
start_service() {
    if is_running "$1"; then
        echo "$1 is already running"
    else
        echo "Starting $1..."
        $1 &
    fi
}

# Start services in the specified order
start_service "pipewire"
sleep 1
start_service "pipewire-pulse"
sleep 1
start_service "wireplumber"
