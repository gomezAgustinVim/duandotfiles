#!/bin/sh

startWatch() {
    while pgrep -u $UID -x xidlehook >/dev/null; do sleep 1; done
    if [ $(pgrep -c xidlehook) -gt 1 ]; then
        killall -q xidlehook
    fi
    exec xidlehook --not-when-fullscreen --not-when-audio --detect-sleep --timer 300 "lock.sh" - &
}

startWatch

# $suspension --timer 600 "loginctl suspend" -
