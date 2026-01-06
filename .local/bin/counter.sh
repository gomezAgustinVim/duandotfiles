#!/bin/sh

tiempo="$1"
mensaje="$2"
rep=${3:-1}  # ejemplo repetir 3 veces rep = 3
n=0

trap "notify-send 'Interrupción' 'Contador cancelado'; exit" INT

while [ $n -lt "$rep" ]; do
    termdown "$tiempo" && notify-send "$mensaje"
    n=$((n+1))

    [ "$n" -lt "$rep" ] && sleep 10
done
