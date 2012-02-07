if ls --color -d . > /dev/null; then
    alias ls='ls --color=auto'
elif ls -G -d > /dev/null; then
    alias ls='ls -G'
fi

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval
fi
