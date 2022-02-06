#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar unsing the decfault config
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown
