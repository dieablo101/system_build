#!/bin/sh

if ! command -v emacs > ~/../dev/null 2>&1; then
    apk add emacs
else
    echo "Emacs already installed"
fi

if ! command -v ranger > ~/../dev/null 2>&1; then
    apk add ranger
else
    echo "Ranger already installed"
fi

sh git_installer.sh
