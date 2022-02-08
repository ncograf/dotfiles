# !/bin/bash

val=$(pactl get-sink-volume @DEFAULT_SINK@ | grep 'Volume' | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

mute_state=$(pactl get-sink-mute @DEFAULT_SINK@) 
# check if muted or not
if [ "$mute_state" == "Mute: no" ] || [ "$mute_state" == "Mute: nein" ]; then
	symbol="蓼 on"
else
	symbol="蓼 off"
fi

echo "$symbol $val%"
