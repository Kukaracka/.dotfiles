#!/bin/bash

brightnessctl set 50%
ddcutil setvcp 10 50

# notify-send -e \
#     -h string:x-canonical-private-synchronous:brightness_notif \
#     -h int:value:"60" \
#     -u low \
#     -i "$HOME/.config/swaync/icons/brightness-60.png" \
#     "Screen" "Brightness: Medium"
