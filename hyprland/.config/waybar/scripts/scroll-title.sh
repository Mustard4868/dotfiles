#!/bin/bash

length=40
pos=0
last_title=""

while true; do
    title=$(hyprctl activewindow -j | jq -r '.title')

    # Only reset scroll if title changed
    if [[ "$title" != "$last_title" ]]; then
        pos=0
        last_title="$title"
    fi

    if [[ "$title" == "null" ]]; then
        echo "Desktop"
        sleep 1
        continue
    fi

    if [[ "$title" == "Untitled" ]]; then
        echo $(hyprctl activewindow -j | jq -r '.class')
        sleep 1
        continue
    fi

    if [[ "$title" == "~" ]]; then
        echo "Kitty"
        sleep 1
        continue
    fi

    if [[ ${#title} -le $length ]]; then
        echo "$title"
        sleep 1
        continue
    fi

    scroll="${title}   ${title}"
    printf "%s\n" "${scroll:$pos:$length}"
    pos=$(( (pos + 1) % (${#title} + 3) ))
    sleep 0.1
done
