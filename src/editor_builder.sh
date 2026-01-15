#!/bin/sh

## check if emacs server is running, but not ranger
## start emacs with server on .motd



if emacsclient -e "t" && pgrep -a ranger; then
    echo "emacs and ranger are both runnin"
else
    if emacsclient -e "t" > ~/../dev/null 2>&1; then
	# only emacs running, kill emacs and reboot
	echo "kill emacs"
	emacsclient -e '(kill-emacs)'
	emacs ~/.motd
    else
	emacs ~/.motd
	fi
fi


## if ranger running, not emacs, shut down ranger and start emacs

##------- WINDOW NUMBER 2

# if emacs running and not ranger, boot ranger
