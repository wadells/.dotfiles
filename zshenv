# add my scripts to the path
PATH="$PATH:~/.dotfiles/bin"

# check for local configs that needn't be in the .dotfile repo
if [ -f ~/.zshenv.local ]; then
    source ~/.zshenv.local
fi
