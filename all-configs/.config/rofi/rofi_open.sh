#!/usr/bin/env bash
if [[ "$file" == *.py ]]; then
    kitty nvim "$file"
else
    xdg-open "$file"
fi
