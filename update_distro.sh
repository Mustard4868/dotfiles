#!/bin/bash

if [[ $PWD != *".dotfiles"* ]]; then
    echo "This script must be run from the .dotfiles directory."
    exit 1
fi

echo "Select an option (1-3):"
echo "1) Arch (default)"
echo "2) Manjaro"
echo "3) EndeavourOS"

read -r option

echo "Select an option (1-4):"
echo "1) Blue"
echo "2) Green"
echo "3) Mauve"
echo "4) Red"

read -r colors

case $option in
    2)  # Manjaro
        #COLOR="#a6e3a1" # Green
        #color_name="green"
        icon="manjaro-mocha.png"
        ;;
    3)  # EndeavourOS
        #COLOR="#cba6f7" # Mauve
        #color_name="mauve"
        icon="endeavouros-mocha.png"
        ;;
    *)  # Arch
        #COLOR="#89b4fa" # Blue  
        #color_name="blue"
        icon="arch-mocha.png"
        ;;
esac

case $colors in
    1)  # Blue
        COLOR="#89b4fa"
        color_name="blue"
        ;;
    2)  # Green
        COLOR="#a6e3a1"
        color_name="green"
        ;;
    3)  # Mauve
        COLOR="#cba6f7"
        color_name="mauve"
        ;;
    4)  # Red
        COLOR="#ed8796"
        color_name="red"
        ;;
esac

# Change the color of the active border in the hyprland theme
sed -i "/^\([[:space:]]*\)col.active_border/s/\$[a-zA-Z]*/\$${color_name}/g" ./hyprland/.config/hypr/hyprland.conf

# Change the color of the active border in the waybar theme, and change the icon.
waybar_icon_path="$PWD/hyprland/.config/waybar/icons/$icon"
sed -i "s|background-image: url('.*/icons/[^']*');|background-image: url('$waybar_icon_path');|g" ./hyprland/.config/waybar/style.css
sed -i "s/@define-color secondary @[^;]*;/@define-color secondary @$color_name;/g" ./hyprland/.config/waybar/style.css

# Change the border color of rofi
sed -i "s/border-col: #[0-9a-fA-F]*/border-col: $COLOR/g" ./hyprland/.local/share/rofi/themes/catppuccin-mocha.rasi

# Change the border color of wlogout
wlogout_icon_path="$PWD/hyprland/.config/wlogout/icons/$color_name/"
sed -i "s/border-color: #[0-9a-fA-F]*/border-color: $COLOR/g" ./hyprland/.config/wlogout/style.css
sed -i -E 's|(background-image: url\(").*/[^/]+/([^/]+\.svg"\);)|\1'"$wlogout_icon_path"'\2|' ./hyprland/.config/wlogout/style.css

# Dunstrc
sed -i -E "s/(frame_color = \")#[0-9a-fA-F]+(\".*)/\1$COLOR\2/" ./hyprland/.config/dunst/dunstrc
sed -i -E "s/(highlight = \")#[0-9a-fA-F]+(\".*)/\1$COLOR\2/" ./hyprland/.config/dunst/dunstrc

