#!/bin/bash

# Cache location Hyprlock can read
out="$HOME/.cache/mpris-album-art.jpg"

mkdir -p "$(dirname "$out")"

while true; do
    url=$(playerctl metadata mpris:artUrl)

    # If nothing is playing, skip but keep last image
    if [[ -z "$url" ]]; then
        sleep 1
        continue
    fi

    # Local file (file://…)
    if [[ "$url" == file://* ]]; then
        cp "${url#file://}" "$out" 2>/dev/null
        touch "$out"
        sleep 1
        continue
    fi

    # Remote (Spotify, YT Music etc.)
    curl -sL "$url" -o "$out"
    touch "$out"

    sleep 1
done
