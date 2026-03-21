#!/bin/bash

brightnessctl set 1%
ddcutil setvcp 10 35

# notify-send -e \
#     -h string:x-canonical-private-synchronous:brightness_notif \
#     -h int:value:"10" \
#     -u low \
#     -i "$HOME/.config/swaync/icons/brightness-20.png" \
#     "Screen" "Brightness: Low"
