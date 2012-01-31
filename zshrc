HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory 
setopt nomatch

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

function regen-prompt {
	local wingding="%(?..%B%F{red})\$%(?..%b%f)"
	PROMPT="%F{cyan}%n%f@%F{blue}%m%f:%B%F{blue}%~%f%b$wingding "
	local return_code="%(?..%F{red}%? ↵%f)"
	RPROMPT="${return_code}"
}

function change-title {}

function precmd {
	change-title
	regen-prompt
}


source ~/.dotfiles/vi-mode.zsh

# The following lines were added by compinstall
zstyle :compinstall filename '/home/wjavins/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
