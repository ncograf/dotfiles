#!/bin/sh

# start the urxvt deamon  with 
# -q quiet in the background 
# -o opendisplay -> keep the deamon process running all the time
# -f for fork -> Bound URxvt to its control socket
urxvtd -o -q -f

# start status bar script
# exec /home/nico/scripts/status_bar.sh &
# dwmblocks &

# start up wlan and bluetooth
sudo /usr/src/hardware_tools/wireless_startup.sh &

# setup monitors 
xrandr  --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 3440x1440 --left-of eDP-1

# set wallpaper (a little weird)
source $DOTFILES/zsh/scripts/tools.sh; wal_paper wald

# start nm-applet
# nm-applet &

# merge xrdb settings (like fonts and so on into the terminal)
xrdb -merge ~/.config/X11/.Xresources

# start automatic mounting
udiskie &

# remap capslock to the escape key
setxkbmap -option caps:escape

# start bspwm
export DESKTOP_SESSION="bspwm"
exec bspwm

