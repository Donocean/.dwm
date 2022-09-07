#!/usr/bin/sh

# set screen size and direction
xrandr --output DSI-1 --mode 800x1280 --rotate right --rate 60

# set desktop background images
feh --bg-fill --randomize ~/pictures/*

# use compton
compton -b

# run status bar
/bin/bash ~/.dwm/scripts/dwm-statusbar.sh &

