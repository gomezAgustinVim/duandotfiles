#!/bin/sh

# hyperborea route
bloqueo=($XDG_DATA_HOME/lockscreen.png)

# Lock screen
lock() {
    i3lock -e -f -L \
    --radius 60 --ring-width 5 \
    --ind-pos="233:713" \
    -i $bloqueo
}

lock

# empieza en x = 172, termina en x = 293
# empieza en y = 768, termina en y = 652
