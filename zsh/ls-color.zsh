if ls --color -d . > /dev/null 2>&1; then
    alias ls='ls --color=auto'
    export LS_COLORS="di=34:ln=36:so=35;40:pi=1;35;40:ex=33:bd=32;40:cd=33;40:su=31:sg=1;31:tw=1;35:ow=35:or=31;40:"
elif ls -G -d . > /dev/null 2>&1; then
    alias ls='ls -G'
    export CLICOLOR=1
    export LSCOLORS=exgxfaFadxcadabxBxFxfx
fi
