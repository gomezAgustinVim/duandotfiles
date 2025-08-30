#!/bin/usr/bin/env bash

if [ "$XDG_SESSION_TYPE" != "wayland" ]; then
    echo "" | xclip -sel clip
    gpg -d "$1" | xclip -r -sel clip
    sleep 5
    echo "" | xclip -sel clip
fi

echo "" | wl-copy
gpg -d "$1" | wl-copy --trim-newline
sleep 5
echo "" | wl-copy
