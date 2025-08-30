#!/usr/bin/env bash
# If already running, end this and running instance.
pkill -f "entr compiler" && exit
echo "$1" | entr compiler.sh "$1"
