#!/bin/zsh

ftmuxp() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get the IDs
    ID="$(ls $XDG_CONFIG_HOME/tmuxp | sed -e 's/\.yml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="Create New Session"

    ID="${create_new_session}\n$ID"
    ID="$(echo $ID | fzf | cut -d: -f1)"

    if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "$ID" ]]; then
        # Rename the current urxvt tab to session name
        printf '\033]777;tabbedx;set_tab_name;%s\007' "$ID"
        tmuxp load "$ID"
    fi
}

change_volume()
{
    if [ -z $1 ] && [ -z $2 ]; then
        exit 0
    fi

    if [ "$1" = "down" ]; then
        change=-$2
    elif [ "$1" = "up" ]; then
        change=+$2
    fi

    # lower volume
    pactl set-sink-volume @DEFAULT_SINK@ $change%
}

check_flightmode_on()
{
    if [ "$(cat /etc/flightmode/mode)" -eq 1 ]; then
        echo 1
    else
        echo 0
    fi
}



screenshot()
{

    if [ "$1" = "clip" ] ; then
        magick import /tmp/imagemagic.jpg
        xclip -sel clipboard -target image/jpeg /tmp/imagemagic.jpg
    elif [ $# -eq 2 ]  &&  [ "$1" = "file" ] && [[ $2 =~ \.jpg$ ]] ; then
        magick import /tmp/imagemagic.jpg
        mv /tmp/imagemagic.jpg $2
    else 
        # geneerate filename
        mkdir -p "$HOME/screenshots"
        count=0
        name="$HOME/screenshots/screenshot$count.jpg"
        while [ -f $name ] 
        do
            (( $count += 1 ))
            name="$HOME/screenshots/screenshot$count.jpg"
        done
        magick import $name
        echo "screenshot saved in $name"
    fi

}


wal_full() 
{
    wal -n -i "$1"
    # configured for 3 screens
    feh --bg-fill "$1" "$1" "$1"
}

wal_paper()
{

    if [[ $1 == full ]] && [[ -f $2 ]] ; then
      wal_full "$2"
    elif [[ $1 == scheme ]] && [[ -f $2 ]] ; then
      wal -n -i "$2"
    elif [[ $1 == wald ]] ; then
      wal_full "$WALLPAPERS/wald.jpg"
    elif [[ $1 == math ]] ; then
      wal_full "$WALLPAPERS/math.jpg" 
    elif [[ -f "$XDG_CONFIG_HOME/wal/wal" ]] && [[ -f $(< "$XDG_CONFIG_HOME/wal/wal") ]] ; then 
      wal_full $(< "/home/nico/.cache/wal/wal")
    else
      # default paper
      wal_full "$WALLPAPERS/math.jpg" 
    fi

}
 
toggle_monitor()
{

    # check if there is an input
    if [ -z $1 ] ; then
        return
    fi

    # on option left put the HDMI-1 screen on the left
    if [ "$1" = "left" ] ; then
        mons -e left
        extend_hdmi
        wal_paper.sh
        bspc wm -r 
    elif [ "$1" = "right" ] ; then
        mons -e right
        extend_hdmi
        wal_paper.sh
        bspc wm -r 
    elif [ "$1" = "same" ] ; then
        merge_hdmi
        mons -d
        wal_paper.sh
        bspc wm -r 
    elif [ "$1" = "only-screen" ] ; then
        merge_hdmi
        mons -o
        wal_paper.sh
        bspc wm -r 
    fi

}

rs_bt()
{
    sudo /usr/src/hardware_tools/restart_bluetooth.sh
}

cisco()
{
    /opt/cisco/anyconnect/bin/vpnui
}

#
# Bspwm scripts for desktop handling 
#
merge_hdmi()
{
    bspc desktop II -m eDP-1
    bspc desktop IV -m eDP-1
    bspc desktop VI -m eDP-1
    bspc desktop VIII -m eDP-1
    bspc desktop X -m eDP-1
    bspc monitor eDP-1 -o I II III IV V VI VII VIII IX X
}

extend_hdmi()
{
    bspc desktop II -m HDMI-1
    bspc desktop IV -m HDMI-1
    bspc desktop VI -m HDMI-1
    bspc desktop VIII -m HDMI-1
    bspc desktop X -m HDMI-1
    bspc monitor HDMI-1 -o II IV VI VIII X
    bspc monitor eDP-1 -o I III V VII IX

}
