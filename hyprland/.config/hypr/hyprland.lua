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

-- Set monitor configuration
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-- Global Variables
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun"

local colors      = require("catppuccin-mocha")

-- Startup Applications
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
    hl.exec_cmd("swaybg -i $HOME/Pictures/Wallpapers/satellite.png -m fill")
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
hl.env("XCURSOR_SIZE", "32")
hl.env("XCURSOR_THEME", "catppuccin-mocha-dark-cursors")
hl.env("HYPRCURSOR_SIZE", "32")
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

-----------------------
---- LOOK AND FEEL ----
-----------------------
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
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeOutQuint", { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear", { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear", { type = "bezier", points = { {0.5, 0.5}, {0.75, 1} } })
hl.curve("quick", { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

-- Default springs
hl.curve("easy", { type = "spring", mass = 1, stiffness = 238.1191, dampening = 24.21279333 })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2.5, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 2.5, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.5, bezier = "easeInOutCubic", style = "slide" })
hl.animation({ leaf = "specialWorkspace", enabled= true, speed = 4, bezier = "easeInOutCubic", style = "slidefadevert -50%"})
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


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


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind("CTRL + ALT + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("wlogout -b 1"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("pkill waybar && waybar"))
hl.bind(mainMod .. " + SHIFT + F", function ()
    hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
    hl.dispatch(hl.dsp.window.resize({ x = "942", y = "500" }))
    hl.dispatch(hl.dsp.window.center())
end)

-- Screenshots
hl.bind("Print",
    hl.dsp.exec_cmd(
    "grim - | tee \"$GRIM_DEFAULT_DIR/screenshot-$(date +'%Y%m%d-%H%M%S').png\" | wl-copy && notify-send \"Screenshot\" \"Saved to $GRIM_DEFAULT_DIR\""))
hl.bind(mainMod .. " + SHIFT + S",
    hl.dsp.exec_cmd(
    "sh -c 'grim -g \"$(slurp)\" - | { read -r first_byte && [ -n \"$first_byte\" ] && (echo \"$first_byte\"; cat) | tee \"$GRIM_DEFAULT_DIR/screenshot-$(date +'%Y%m%d-%H%M%S').png\" | wl-copy; }' && notify-send \"Screenshot\" \"Saved to $GRIM_DEFAULT_DIR\""))
hl.bind(mainMod .. " + CTRL + S",
    hl.dsp.exec_cmd(
    "grim -g \"$(hyprctl activewindow -j | jq -r '[.at[0]-2, .at[1]-2, .size[0]+4, .size[1]+4] | @sh' | tr -d \"'\" | awk '{print $1\",\"$2, $3\"x\"$4}')\" - | tee \"$GRIM_DEFAULT_DIR/screenshot-$(date +'%Y%m%d-%H%M%S').png\" | wl-copy && notify-send \"Screenshot\" \"Saved to $GRIM_DEFAULT_DIR\""))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + GRAVE",         hl.dsp.workspace.toggle_special())
hl.bind(mainMod .. " + SHIFT + GRAVE", hl.dsp.window.move({ workspace = "special" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("XF86Calculator", hl.dsp.exec_cmd("gnome-calculator"), { locked = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

local custom_opacity = "0.8"

hl.window_rule({ match = { initial_class = "kitty" }, opacity = custom_opacity })
hl.window_rule({ match = { initial_class = "code" }, opacity = custom_opacity })
hl.window_rule({ match = { initial_class = "spotify" }, opacity = custom_opacity })
hl.window_rule({ match = { initial_class = "dev.zed.Zed" }, opacity = custom_opacity })
hl.window_rule({ match = { initial_class = "discord" }, opacity = "0.9" })
