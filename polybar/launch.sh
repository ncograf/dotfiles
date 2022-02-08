#!/bin/bash

DIR="$XDG_CONFIG_HOME/polybar"

# Terminate already running bar instances
killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar unsing the decfault config
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar -q main -c "$DIR"/config.ini &
    done
else
    MONITOR=$m polybar -q main -c "$DIR"/config.ini &
fi
