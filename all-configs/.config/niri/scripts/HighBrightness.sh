#!/bin/bash

brightnessctl set 100%
ddcutil setvcp 10 75

# notify-send -e \
#     -h string:x-canonical-private-synchronous:brightness_notif \
#     -h int:value:"100" \
#     -u low \
#     -i "$HOME/.config/swaync/icons/brightness-100.png" \
#     "Screen" "Brightness: High"
