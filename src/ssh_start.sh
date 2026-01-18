#!/bin/sh

## could create duplicate agents
# eval "$(ssh-agent -s)"
# ssh-add ~/.ssh/dieablo101_github
# echo "Github running agent PID: " | echo $SSH_AGENT_PID

# check if ssh installed if
if command -v ssh > /dev/null; then
    echo "openssh is installed and ready"
fi

# Only start a new agent if one isn't already running
   # $SSH_AUTH_SOCK is set by openssh and is an environment variable that is either containing a string or not, if (-z is zero length) string is empty and test is true. then we use eval 
if [ -z "$SSH_AUTH_SOCK" ]; then
   eval "$(ssh-agent -s)" > /dev/null
   ssh-add ~/.ssh/dieablo101_github > /dev/null 2&>1
fi

ssh -T git@github.com
