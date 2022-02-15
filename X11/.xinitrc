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
if [ -f ~/.cache/wal/colors.Xresources ]; then
    xrdb -merge ~/.cache/wal/colors.Xresources
fi

# start automatic mounting
udiskie &

# remap capslock to the escape key
setxkbmap -option caps:escape

# set up xecurelock
export XSECURELOCK_SAVER=saver_xscreensaver xsecurelock
export XSECURELOCK_AUTH_BACKGROUND_COLOR=$(sed "1q;d" ${XDG_CACHE_HOME}/wal/colors)
export XSECURELOCK_AUTH_FOREGROUND_COLOR=$(sed "2q;d" ${XDG_CACHE_HOME}/wal/colors)
export XSECURELOCK_AUTH_TIMEOUT=10
export XSECURELOCK_DIM_TIME_MS=1000
export XSECURELOCK_FONT="xft:Hack\ Nerd\ Font\ Mono:style=Regular:size=13:antialias=true:autohint=true"
export XSECURELOCK_PASSWORD_PROMPT=time
export XSECURELOCK_SHOW_USERNAME=0
export XSECURELOCK_SHOW_HOSTNAME=0
export XSECURELOCK_SHOW_DATETIME=0
export XSECURELOCK_SINGLE_AUTH_WINDOW=1
export XSECURELOCK_SAVER=saver_blank

xset s 600 10
xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock &

# start bspwm
export DESKTOP_SESSION="bspwm"
exec bspwm

