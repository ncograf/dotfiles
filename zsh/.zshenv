#
# this file will be executed on the startup of zsh
# the order is
# $ZDOTDIR/.zshenv
# $ZDOTDIR/.zprofile
# $ZDOTDIR/.zshrc
# $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout
#
# It should contain user's environment variables
#

# For dotfiles
export XDG_CONFIG_HOME="$HOME/.config"

export DOTFILES="$HOME/dotfiles"

# For specific data
export XDG_DATA_HOME="$HOME/.local/share"

# For cached files
export XDG_CACHE_HOME="$HOME/.cache"

# For editor
export EDITOR="nvim"
export VISUAL="nvim"

export WALLPAPERS="$HOME/wallpapers"


# -- ZSH -- 

# For the config of zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# zsh history filepath (This file must never be in a git repo!!!)
export HISTFILE="$ZDOTDIR/.zhistory"

# zsh maximum events for internal history
export HISTSIZE=10000

# zsh maximum events in history file
export SAVEHIST=10000

# self written scripts 
export PATH="$PATH:$HOME/scripts:$HOME/.local/bin"

# add ripgrep instead of grep as default comamand for fuzy find
# --files -> serach for files
# --hidden -> search for hidden files
# --glob '!.git' -> exclude .git files
export FZF_DEFAULT_COMMAND="rg --files --hidden --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

