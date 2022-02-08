# install script for dotfiles
# still under construction 
# TODO add all dotfiles in here that are not jet there

# note that ln -sf means
# -s -> soft (symbolic) link 
# -f -> force (remove existing files and replace them by the link)

# create direcotry for the shell 
mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"

# add link to the aliases
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"

# add external folder for files we did not write ourselfs
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

# add xinit file 
ln -sf "$DOTFILES/X11/.xinitrc" "$HOME"

########
# nvim #
########
# note that the pluginmanager gets automatically installed when sourcing the init.vim file 
mkdir -p "$XDG_CONFIG_HOME/nvim"
# create undo folder that is used for the undo history as specified in the init.vim config
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"
ln -sf "$DOTFILES/nvim/UltiSnips" "$XDG_CONFIG_HOME/nvim/UltiSnips"

# add Xresources for the settings of uxrvt
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

########
# tmux #
########
mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"
[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ] && git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"

# add tmuxp to automatically create sessions
mkdir -p "$XDG_CONFIG_HOME/tmuxp"
ln -sf "$DOTFILES/tmuxp/mouseless_setup.yml" "$XDG_CONFIG_HOME/tmuxp/mouseless_setup.yml"
ln -sf "$DOTFILES/tmuxp/arch_installer.yml" "$XDG_CONFIG_HOME/tmuxp/arch_installer.yml"

#########
# Fonts #
#########

# TODO fix that fonts in the folder $XDG_DATA_HOME are recoginized
mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

###############
# Keybindings #
###############
ln -sf "$DOTFILES/X11/.xbindkeysrc" "$HOME"
mkdir -p "$XDG_CONFIG_HOME/sxhkd"
ln -sf "$DOTFILES/sxhkd/sxhkdrc" "$XDG_CONFIG_HOME/sxhkd/sxhkdrc"

#########
# bspwm #
#########
mkdir -p "$XDG_CONFIG_HOME/bspwm"
ln -sf "$DOTFILES/bspwm/bspwmrc" "$XDG_CONFIG_HOME/bspwm/bspwmrc"
ln -sf "$DOTFILES/polybar" "$XDG_CONFIG_HOME/polybar"
