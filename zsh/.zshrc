
# this file will be executed on the startup of zsh
# the order is
# $ZDOTDIR/.zshenv
# $ZDOTDIR/.zprofile
# $ZDOTDIR/.zshrc -- this file
# $ZDOTDIR/.zlogin
# $ZDOTDIR/.zlogout
#
# It should be used to configure the shell itself and for running commands
#

# For aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Autocompletition
# vim keybindings for autocompletion
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# We use autoload to load a file as a function (whatever this means) with the same name as the file
# We use autoload instead of 'source /path/of/compinit' becuase autoload has the following advantages
# It avoids name conflicts if you have an executable with the same name
# It doesn't expand aliases thanks to the -U option
# It will load the function only when it's needed (lazy-loading), which nicely speeds up Zsh startup
#
# autoload tries to find the file in the Zsh file serach path defined in $fpath
autoload -U compinit; compinit

# autocomplete hidden files 
source ~/dotfiles/zsh/external/completion.zsh

# add dotfiles to autocompletion (must be run after completion.zsh
_comp_options+=(globdots)

# change the fpath such that the autocompletition finds the cominit file
fpath=($ZDOTDIR/external $fpath)

# change the prompt
PROMPT=$'%F{white}%~ %B%F{blue}>%f%b '

# change keybinding for clearing the shell since ctrl + l is used in tmux to navigate panes
bindkey -r '^l'
bindkey -r '^g'
bindkey -s '^g' 'clear\n'

# Push the current directory visited on to the stack
setopt AUTO_PUSHD

# Do not store duplicated direcotries in the stack
setopt PUSHD_IGNORE_DUPS

# Do not print the directories stack after using pushd or popd
setopt PUSHD_SILENT

# enable vi mode and reduce timeout time 
bindkey -v
export KEYTIMEOUT=17

# remap escape character in comand mode
bindkey -s "jj" "\e"

# fix of not being able to delete some things form history
bindkey -v '^?' backward-delete-char

# change cursor depending on the mode
autoload -Uz cursor_mode && cursor_mode

# add the option to edit command in the favorite editor
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# make syntax highlighting available (zsh-syntax-highlighting must be installed -> pacman)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# simplify going back in direcotries
source ~/dotfiles/zsh/external/bd.zsh

# load infoscirpt for the my zsh
source $DOTFILES/zsh/scripts/infotools.sh
source $DOTFILES/zsh/scripts/tools.sh

# set colorscheme with wal
source ~/.cache/wal/colors-tty.sh

# add fuzy find to the shell
# CTRL + t -> search for a file in the current directory and sub-directories
# CTRL + r -> serach for an entry in the command history
# ALT + c -> Allow you to select a sub-direcotry and make it your working direcotry
# kill followed by TAB to select a process to kill
if [ $(command -v "fzf") ]; then
  source /usr/share/fzf/completion.zsh
  source /usr/share/fzf/key-bindings.zsh
fi

# set up the keychain for ssh
eval $(keychain --eval --quiet gitlab_eth github_rsa)

# start tmux if not already running
#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#  exec tmux
#fi

# start dwm on startup
if [[ -z $DISPLAY ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
  pgrep bspwm || startx 
fi
