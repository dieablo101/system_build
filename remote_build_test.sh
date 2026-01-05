#!/bin/sh

if ! command -v curl &> /dev/null; then
    apk add curl
fi

if [ -f "system.sh" ]; then
    # later build this to check the git against the remote
    echo "local system build exists (read note)"
else
    # first check if ssh is setup properly with git account
        # need to produce an ssh private and pub passkey creation method sh file
        # put "mkssh" ie. "make ssh"
    echo "File not found. Do a git pull" 
fi
# uses 2&>1 to not report error of folder existing already
mkdir src_temp/systemSrc > /dev/null 2>&1
# if [-p mkdir]

# runs local temp_build while we work out the kinks of running remote code with curl
sh temp_build.sh

# curl -fsSL https://raw.githubusercontent.com/dieablo101/system_build/main/temp_build.sh | sh