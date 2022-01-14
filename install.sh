# install script for dotfiles
# still under construction 
# TODO add all dotfiles in here that are not jet there

# note that ln -sf means
# -s -> soft (symbolic) link 
# -f -> force (remove existing files and replace them by the link)

# create direcotry for the shell 
mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/dotfiles/zsh/.zshrc" "$HOME/.config/zsh"

# add link to the aliases
ln -sf "$HOME/dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"

# add external folder for files we did not write ourselfs
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/dotfiles/zsh/external" "$HOME/.config/zsh"

# add xinit file 
ln -sf "$HOME/dotfiles/X11/.xinitrc" "$HOME"
