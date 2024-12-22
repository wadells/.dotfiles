alias k=kubectl

if type kubectl-krew >/dev/null 2> /dev/null; then
    export PATH="${PATH}:${KREW_ROOT:-$HOME/.krew}/bin"
fi
