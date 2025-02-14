#1/usr/bin/env bash
command="rofi -theme $HOME/.config/rofi/screenshot.rasi"

region="R"
fullscreen="F"

options=$region\n$fullscreen

selected="$echo -e "$options" | $command -dmenu -selected-row 0
case $selected in
    $region)
    grim -g "$(slurp)" - | tee "$GRIM_DEFAULT_DIR/screenshot-$(date +'%Y%m%d-%H%M%S').png" | wl-copy
    ;;
    $fullscreen)
    grim - | tee "$GRIM_DEFAULT_DIR/screenshot-$(date +'%Y%m%d-%H%M%S').png" | wl-copy
    ;;
esac