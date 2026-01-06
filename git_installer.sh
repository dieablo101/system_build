#!/bin/bash
linebreak="echo "

yes="[Y|y]"
no="[N|n]"

### GIT INSTALL + CHECK
# Git Variables
	# if true, get is installed
checkGitStatus="false"
gitUsername=""
gitEmail=""
gitValidityValue="y"

# -------- CREATES GLOBAL GIT FILE FOR MANAGING SANDBOXED PILOT OS --------

# navigate into sys folder
cd ~/../sys/

if command -v git > ~/../dev/null 2>&1; then
	# git insetalled
	echo " ‣ 💾 Git functioning "
	checkGitStatus="true"
fi

configGit() {
		git config --global user.name $gitUsername
		git config --global user.email $gitEmail
		git config --global --add safe.directory "*"
		git config --global init.defaultBranch main
}

ignoreGit() {
		rm ~/../sys/.gitignore
		touch .gitignore
		
		echo "*" >> .gitignore
		# whitelists files
		echo "!.gitignore" >> .gitignore
		echo "!git_installer.sh" >> .gitignore
		echo "!system.sh" >> .gitignore
		echo "!ssh_start.sh" >> .gitignore
		echo "!temp_build.sh" >> .gitignore
		echo "!reset_remote_git.sh" >> .gitignore
		echo "!editor_build.sh" >> .gitignore
}

remoteGit() {
		git remote add origin git@github.com:dieablo101/system_build.git
		git remote -v
		git remote set-url origin git@github.com:dieablo101/system_build.git
		
		# used to reset from remote during install ( EXPERIMENTAL )		# 
		# sh reset_remote_git.sh
		
}

# git not installed
while ! $checkGitStatus; do

read -p "  👤 Git Username: " gitUsername
read -p "  📧 Git Email: " gitEmail

$linebreak
read -p " ❔ Git credentials accurate [y/n] : " gitValidityValue

	if [[ $gitValidityValue == $yes ]]; then
		
		$linebreak	
		echo "◦ Installing Git"
		apk add git
		configGit
		
		# rm -r ~/../sys/.git
		# git init
		
		ignoreGit
		remoteGit

		checkGitStatus="true"
	fi
done
