HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=100000
setopt appendhistory 
setopt nomatch

bindkey -v # vi mode editing

VIMODE='[i]'
function zle-keymap-select {
	VIMODE="${${KEYMAP/vicmd/[n]}/(main|viins)/[i]}"
	zle reset-prompt
}

zle -N zle-keymap-select

function regen_prompt {
	local wingding="%(?..%B%F{red})\$%(?..%b%f)"
	PROMPT="%F{cyan}%n%f@%F{blue}%m%f:%B%F{blue}%~%f%b$wingding "
	local return_code="%(?..%F{red}%? ↵%f)"
	RPROMPT="${return_code}"
}

function change_title {}

function precmd {
	change_title
	regen_prompt
}

# The following lines were added by compinstall
zstyle :compinstall filename '/home/wjavins/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
