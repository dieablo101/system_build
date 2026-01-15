# source required sh file
source src/ssh_start.sh
# non source sh executions
sh src/sys/main.sh
#sh ~/../sys/editor_builder.sh
# System variable
export EDITOR="emacs -nw"
# export EDITOR="emacsclient -nw -c -a"
# export EDITOR="emacsclient -nw -a emacs"
# export RANGER_LOAD_DEFAULT_RC=FALSE
