# !/bin/bash

val=$(pactl get-source-volume @DEFAULT_SOURCE@ | grep 'Volume' | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')

mute_state=$(pactl get-source-mute @DEFAULT_SOURCE@) 
# check if muted or not
if [ "$mute_state" == "Mute: no" ] || [ "$mute_state" == "Mute: nein" ]; then
	symbol=" on"
else
	symbol=" off"
fi

echo "$symbol $val%"
