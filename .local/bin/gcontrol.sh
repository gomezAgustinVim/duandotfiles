#!/bin/sh

file=$HOME/Documentos/tokengit.txt

cat $file | xargs -I '{}' echo -n {} | xclip -sel clip
git push
echo "" | xclip -sel clip # empties xclip for safety
