# couldn't figure out how to get colors to work in the vim mode
# prompt without this
autoload -U colors && colors

# Allow command line editing in an external editor.
autoload -U edit-command-line

MODE_INDICATOR="%{$fg[green]%}<<<%{$reset_color%}"
RPROMPT_ORIG=$RPROMPT

function zle-line-init zle-keymap-select {
	RPROMPT="${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/$RPROMPT_ORIG}"
	zle reset-prompt
}

# Accept RETURN in vi command mode.
function accept_line {
	RPROMPT="$RPROMP_ORIG"
	builtin zle .accept-line
}

zle -N zle-line-init
zle -N zle-keymap-select
zle -N accept_line
zle -N edit-command-line

bindkey -v # use vi key bindings
bindkey -M vicmd "^M" accept_line # allow enter in cmd mode
bindkey -M vicmd v edit-command-line # ESC-v to edit in an external editor.

bindkey "^?" backward-delete-char # fixes backspace in insert mode

bindkey ' ' magic-space
bindkey -M vicmd "gg" beginning-of-history
bindkey -M vicmd "G" end-of-history
bindkey -M vicmd "k" history-search-backward
bindkey -M vicmd "j" history-search-forward
bindkey -M vicmd "?" history-incremental-search-backward
bindkey -M vicmd "/" history-incremental-search-forward

bindkey -M viins "^L" clear-screen
