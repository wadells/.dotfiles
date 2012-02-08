function regen-prompt {
	local wingding="%(?..%B%F{red})\$%(?..%b%f)"
	PROMPT="%F{cyan}%n%f@%F{cyan}%m%f:%F{blue}%~%f$wingding "
	local return_code="%(?..%F{red}%? ↵%f)"
	RPROMPT="${return_code}"
}

function change-title {}

function precmd {
	change-title
	regen-prompt
}

for config_file (~/.dotfiles/zsh/*.zsh) source $config_file

# The following lines were added by compinstall
zstyle :compinstall filename '/home/wjavins/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# check for local configs that needn't be in the .dotfile repo
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi
