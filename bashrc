# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Environment Variables (perhaps these should be in .bash_profile?)
export EDITOR=vim

# Colors
#################################################
export TERM=xterm-color
export CLICOLOR=1

NRML="\[\e[0m\]"
WHITE="\[\e[0;37m\]"
RED="\[\e[1;31m\]"
GRN="\[\e[1;32m\]"
CYN="\[\e[0;36m\]"
BLU="\[\e[0;34m\]"
blu="\[\e[1;34m\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias dir='dir --color=auto'
	export GREP_OPTIONS='--color=auto -E' GREP_COLOR='1;32'
	export ACK_OPTIONS='--color-match=green --color-filename=magenta --color-lineno=blue'
fi
			    

# History
#################################################

# don't put duplicate lines in the history 
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# lots of history, space is cheap
HISTSIZE=1000
HISTFILESIZE=50000

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
#################################################

# To temporarily bypass an alias, proceed the command with a \
# EG: the ls command is aliased, but to use the normal ls command you 
# would type \ls

# Dummy protection from accidentally deleting files and folders
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias la="ls -A"
alias ll="ls -l"
alias ..="cd .."

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
#################################################

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
	*color) PROMPT_COMMAND='PS1="${CYN}\u${NRML}@${BLU}\h${NRML}:${blu}\w`errcolor $?`\$${NRML} ";'	
	;;
	*) PS1="\u@\h:\w\$ "
esac

# Local Modifications
#################################################

# many boxen have local configs that shouldn't be tracked.
# these configs can go in .bashrc.local.
if [ -f ~/.bashrc.local ]; then
	source ~/.bashrc.local
fi
