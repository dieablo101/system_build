#!/bin/bash
#
pullRemote() {
	git fetch origin && git reset --hard origin/main && git clean -fd
}

pullRemote