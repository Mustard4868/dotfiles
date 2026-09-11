--    ██░ ██▓██   ██▓ ██▓███   ██▀███
--   ▓██░ ██▒▒██  ██▒▓██░  ██▒▓██ ▒ ██▒
--   ▒██▀▀██░ ▒██ ██░▓██░ ██▓▒▓██ ░▄█ ▒
--   ░▓█ ░██  ░ ▐██▓░▒██▄█▓▒ ▒▒██▀▀█▄
--   ░▓█▒░██▓ ░ ██▒▓░▒██▒ ░  ░░██▓ ▒██▒
--    ▒ ░░▒░▒  ██▒▒▒ ▒▓▒░ ░  ░░ ▒▓ ░▒▓░
--    ▒ ░▒░ ░▓██ ░▒░ ░▒ ░       ░▒ ░ ▒░
--    ░  ░░ ░▒ ▒ ░░  ░░         ░░   ░
--    ░  ░  ░░ ░                 ░
--           ░ ░

-- Require needed files
require("keybinds")
require("windowrules")
require("animations")

-- Get color theme
local colors = require("catppuccin-mocha")

-- Set monitor configuration
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-- Startup Applications
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("swaybg -i $HOME/Pictures/Wallpapers/artemis-ii-window.jpg -m fill")
    hl.exec_cmd("dunst & waybar")
    hl.exec_cmd("nm-applet --no-agent")
    hl.exec_cmd("udiskie -t")
    hl.exec_cmd("dex -a -s ~/.config/autostart")
    hl.exec_cmd("~/.config/hypr/scripts/get-album-art.sh")
    hl.exec_cmd(
    "sleep 5 && UPGRADES=$(checkupdates| wc -l); if [ $UPGRADES -ne 0 ]; then notify-send \"Updates\" \"You have $UPGRADES package(s) available for upgrade.\"; fi")
    hl.exec_cmd("sleep 5 && XDG_MENU_PREFIX=arch- kbuildsycoca6")
end)

-- Environment Variables
hl.env("AQ_DRM_DEVICES", "/dev/dri/card1:/dev/dri/card0")
hl.env("XCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("XDG_PICTURES_DIR", "$HOME/Pictures")
hl.env("GRIM_DEFAULT_DIR", "$HOME/Pictures/Screenshots")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")

-- Configuration
hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,
        border_size = 3,
        col = {
            active_border   = colors.mauve,
            inactive_border = colors.surface0,
        },
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
            enabled      = false,
        },
        blur = {
            enabled   = true,
            size      = 4,
            passes    = 2,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
        mouse_move_focuses_monitor = false,
        middle_click_paste = false,
    },
})

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})
