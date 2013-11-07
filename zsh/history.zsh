## Command history configuration
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000

setopt extended_history
setopt append_history
setopt inc_append_history
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify # when using !history commands, ask for a return before executing
setopt hist_no_store # ignore history commands

funtion hist () {
if [ -z $* ]
	then
		history 1
	else
		history 1 | grep -E $@
	fi
}
