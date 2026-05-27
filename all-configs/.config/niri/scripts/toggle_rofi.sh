




#!/usr/bin/env bash

if pgrep -x "rofi" > /dev/null; then
    # Если rofi запущен, закрываем его
    pkill rofi
else
    # Если rofi не запущен, открываем его (укажите ваш режим, например, drun)
    rofi -show drun run -theme $HOME/.config/rofi/launchers/type-2/style-2.rasi
fi
