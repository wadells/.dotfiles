#!/bin/bash
# Personal aliases and programs for javins 
# <walt.javins.net>

# Environment Variables (perhaps these should be in .bash_profile?)
export EDITOR=vim
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export ACK_OPTIONS='--color-match=green --color-filename=magenta --color-lineno=blue'

# Colors
########################################################################
export TERM=xterm-color
export CLICOLOR=1

NRML="\[\e[0m\]"
WHITE="\[\e[0;37m\]"
RED="\[\e[1;31m\]"
GRN="\[\e[1;32m\]"
CYN="\[\e[0;36m\]"
BLU="\[\e[0;34m\]"

if [ "$OS" = "linux" ] ; 
then
  	# ls colors, see: 
  	# http://www.linux-sxs.org/housekeeping/lscolors.html
  	export LS_COLORS='fi=0:di=34:ln=36:pi=93:bd=93:so=93:cd=93:ex=32:su=31:sg=31:tw=34:47:st=34:47'
  	alias ls='ls --color=auto' # For linux, etc	
else
	# OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux 
	# it's no groups
	export LSCOLORS="fxgxDxDxcxDxDxbxbxeheh"
	alias ls='ls -G'	
fi

# History
########################################################################

# Save lots of commands in the history
export HISTFILESIZE=999

# Don't put duplicate lines in the history file
export HISTCONTROL=ignoredups

# My speedy way to access history, or specific commands in
# history
hist () {
	if [ $# = 0 ]
	then
		history
	else
		history | grep $*
	fi
}

# A profiler to find your most used commands
alias hprofile="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Modified / New Commands
########################################################################

# To temporarily bypass an alias, proceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you 
# would type \ls

# Dummy protection from accidentally deleting files and folders
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias eclipse="open -a Eclipse"
alias la="ls -A"
alias ll="ls -l"
alias ..="cd .."

# For now. Remove to run python 2.x. 
alias python="python3"

# git completion
source ~/.git-completion.bash

# LaTeX commands
alias tex="pdflatex"

texclean () {
    if [ $1 = "-f" ]
	then
		rm -f *.log *.aux
	else
		rm *.log *.aux
	fi
}

# Prompt
############################################################

# A function to set the color based on the return value of the previous
# command.
errcolor () {
    if [ $1 = "0" ]
    then
        echo -n $NRML
    else
        echo -n $RED
    fi
}

# My personal prompt!
case $TERM in
    xterm*) # xterm prompt
        PROMPT_COMMAND='PS1="${CYN}\u${NRML}@${BLU}\h ${NRML}[ \W ]`errcolor $?`\$${NRML} ";'
        ;;
    *) # catch all prompt
        PROMPT_COMMAND='PS1="${CYN}\u${NRML}@${BLU}\h ${NRML}[ \W ]`errcolor $?`\$${NRML} ";'
    esac
