local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps.
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
