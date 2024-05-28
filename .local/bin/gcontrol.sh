#!/bin/sh

file=$HOME/Documentos/tokengit.txt

# makes a commit
committing() {
    read -p "Mensaje para el commit: " commit_message
    read -p "Archivo para el commit: " commit_file
    git commit -m "$commit_message" $commit_file
}

pushing() {
    cat $file | xargs -I '{}' echo -n {} | xclip -sel clip
    git push
    echo "" | xclip -sel clip # empties xclip for safety
}

ask() {
    choice=$(printf "Add\\nUpdate\\nPush" | dmenu -i -p "Qué opción desea ejecutar?")
    case "$choice" in
        Commit) committing ;;
        Push) pushing ;;
    esac
}

ask
