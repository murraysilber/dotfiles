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
local config = wezterm.config_builder()

-- Set the color scheme depending on the system setting
function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

function scheme_for_appearance(appearance)
    if appearance:find 'Dark' then
        return 'Gruvbox dark, medium (base16)'
    else
        return 'Gruvbox light, hard (base16)'
    end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- Set all padding
config.window_padding = { left = 10, right = 10, top = 10, bottom = 10 }

-- Font configuration
config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'
config.font_size = 26
config.line_height = 1.1

-- Remove the title bar from the window
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

-- Use zsh by default
-- config.default_prog = { '/usr/bin/zsh' }

-- Don't hide cursor when typing
config.hide_mouse_cursor_when_typing = false

-- General configs
config.automatically_reload_config = true
config.enable_tab_bar = false

-- URLs in Markdown files are not handled properly by default
-- Source: https://github.com/wez/wezterm/issues/3803#issuecomment-1608954312
config.hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
        regex = '\\((\\w+://\\S+)\\)',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
        regex = '\\[(\\w+://\\S+)\\]',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
        regex = '\\{(\\w+://\\S+)\\}',
        format = '$1',
        highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
        regex = '<(\\w+://\\S+)>',
        format = '$1',
        highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
        -- Before
        --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
        --format = '$0',
        -- After
        regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
        format = '$1',
        highlight = 1,
    },
    -- implicit mailto link
    {
        regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
        format = 'mailto:$0',
    },
}

-- Return the configuration to wezterm
return config
