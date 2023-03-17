if [ -f "$HOME/go/bin" ]; then
    export $PATH="$PATH:~/go/bin"
fi
if [ -f "/usr/local/go/bin" ]; then
    export $PATH="$PATH:/usr/local/go/bin"
fi
