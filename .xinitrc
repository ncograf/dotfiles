# start status bar script
# exec /home/nico/scripts/status_bar.sh &
dwmblocks &

# start up wlan and bluetooth
sudo /home/nico/scripts/root_access/wireless_startup.sh &

# setup monitors 
xrandr  --output eDP-1 --mode 1920x1080 --output HDMI-1 --mode 3440x1440 --left-of eDP-1

# setup keybindings
xbindkeys

# start dwm
exec dwm
