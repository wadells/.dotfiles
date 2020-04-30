# check for local configs that needn't be in the .dotfile repo
if [ -f ~/.zshenv.local ]; then
    source ~/.zshenv.local
fi
