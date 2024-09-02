#!/bin/sh

echo "" | xclip -sel clip
gpg -d $1 | xclip -r -sel clip
sleep 5
echo "" | xclip -sel clip
