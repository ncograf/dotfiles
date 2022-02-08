# !/bin/bash

# get status 
# 3 : not available
# 2 : not connected
# 1 : connected


on=0
connected=0
text=" off"

if [ "$(bluetoothctl show | grep 'Powered: yes' | wc -l)" -eq 1 ]; then
	on=1
fi

if [ "$(bluetoothctl info | grep 'Connected: yes' | wc -l)" -eq 1 ]; then
	connected=1
fi

if [ $on -eq 1 ]; then
	if [ $connected -eq 1 ]; then
                text=" connected"
	else
                text=" on"
	fi
fi

echo "$text"
