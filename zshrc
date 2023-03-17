function regen-prompt () {
    local wingding="%(?..%{$fg[red]%})\$%(?..%{$reset_color%})"
    PROMPT="%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[cyan]%}%m%f:%{$fg[blue]%}%~%{$reset_color%}$wingding "
    local return_code="%(?..%{$fg[red]%}[%?])%{$reset_color%}"
    RPROMPT="${return_code}"
}

function change-title () {}

function precmd () {
	change-title
	regen-prompt
}

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -U compinit
compinit
# End of lines added by compinstall

for config_file (~/.dotfiles/zsh/*.zsh) source $config_file

# check for local configs that needn't be in the .dotfile repo
if [ -f ~/.zshrc.local ]; then
	source ~/.zshrc.local
fi

# Remove any duplicate path entries
typeset -U PATH
