--
-- ██╗    ██╗███████╗███████╗████████╗███████╗██████╗ ███╗   ███╗
-- ██║    ██║██╔════╝╚══███╔╝╚══██╔══╝██╔════╝██╔══██╗████╗ ████║
-- ██║ █╗ ██║█████╗    ███╔╝    ██║   █████╗  ██████╔╝██╔████╔██║
-- ██║███╗██║██╔══╝   ███╔╝     ██║   ██╔══╝  ██╔══██╗██║╚██╔╝██║
-- ╚███╔███╔╝███████╗███████╗   ██║   ███████╗██║  ██║██║ ╚═╝ ██║
--  ╚══╝╚══╝ ╚══════╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝
-- A GPU-accelerated cross-platform terminal emulator
-- https://wezfurlong.org/wezterm/

-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
config = wezterm.config_builder()

config = {

    -- General Options
    automatically_reload_config = true,
    enable_tab_bar = false,
    window_close_confirmation = "NeverPrompt",
    window_decorations = "RESIZE",
    native_macos_fullscreen_mode = false,

    -- Terminal Text Appearance
    color_scheme = 'Gruvbox dark, medium (base16)',
    font = wezterm.font("JetBrainsMono Nerd Font"),
    font_size = 24,
    line_height = 1.0,
    window_padding = {
        left = 10,
        right = 10,
        top = 10,
        bottom = 10,
    },
}

-- and finally, return the configuration to wezterm
return config
