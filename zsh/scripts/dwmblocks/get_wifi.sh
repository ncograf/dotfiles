# !/bin/bash

# get status 
# 3 : not available
# 2 : not connected
# 1 : connected

if [ "$(nmcli d | grep -E '^wlp3s0(.)*nicht verbunden' | wc -l)" -eq 1 ]; then
	status=2
elif [ "$(nmcli d | grep -E '^wlp3s0(.)*verbunden' | wc -l)" -eq 1 ]; then
	status=1
else
	status=3
fi

if [ $status -eq 1 ]; then
	text=$(nmcli d wifi show | grep SSID | cut -d" " -f2)
elif [ $status -eq 2 ]; then
	text="on"
else
	text="off"
fi

#icons="直 直 "
#icon=$(echo $icons | cut -d" " -f$status)

icon=直

echo "$icon $text"
