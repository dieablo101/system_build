
#!/bin/sh

# install ranger and emacs
#apk add emacs
#apk add ranger

if ! command -v emacs > ~/../dev/null 2>&1; then
    apk add emacs
else
    echo "Emacs already installed\n"
fi

if ! command -v ranger > ~/../dev/null 2>&1; then
   apk add ranger
else
    echo "Ranger already installed\n\n"
fi

echo "editor builder running"
