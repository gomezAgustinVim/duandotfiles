#!/bin/sh

echo "" | wl-copy
gpg -d $1 | wl-copy
sleep 5
echo "" | wl-copy
