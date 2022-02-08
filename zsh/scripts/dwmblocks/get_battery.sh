# !/bin/bash

# get capacity
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $capacity -eq 100 ]; then
	full=1
else 
	full=0
fi

# get on of three modes: (Discharginig :  full (battery 100%) : Charging)
discharging=$(cat /sys/class/power_supply/BAT0/status | grep Discharging | wc -l)
charging=$(cat /sys/class/power_supply/AC/online)

if [ $full -eq 1 ]; then
	echo " $capacity%"
elif [ $discharging -eq 1 ]; then
	echo " $capacity%"
elif [ $charging -eq 1 ]; then
	echo " $capacity%"
else
	echo " $capacity%"
fi
