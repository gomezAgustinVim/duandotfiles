#!/bin/sh

# A script that literally gives you a fumo face
while true; do
  read -r -p "Fumo? Happy or Sad? (H/S): " input
  case $input in
    [Hh] ) echo -n "ᗜˬᗜ" | xclip -sel clip; echo "ᗜˬᗜ" && break ;;
    [Ss] ) echo -n "ᗜ˰ᗜ" | xclip -sel clip; echo "ᗜ˰ᗜ" && break ;;
    * ) echo "Bad option" ;;
  esac
done
