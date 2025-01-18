require 'core.options'  -- Load general options
require 'core.keymaps'  -- Load general keymaps
require 'core.snippets' -- Custom code snippets

-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)
-- Import color theme based on environment variable NVIM_THEME
local default_color_scheme = 'gruvbox'
local env_var_nvim_theme = os.getenv 'NVIM_THEME' or default_color_scheme

-- Define a table of theme modules
local themes = {
  gruvbox = 'plugins.themes.gruvbox',
  onedark = 'plugins.themes.onedark',
}

-- Setup
require('lazy').setup({

  -- import plugins
  spec = {
    require(themes[env_var_nvim_theme]),
    require "plugins.treesitter",
    require "plugins.which-key",
    require "plugins.lualine",
    -- require "plugins.telescope",
    -- require "plugins.mini-nvim",
    -- require "plugins.plugins",
    -- require "plugins.lsp.mason"
  },  
    -- automatically detect config file changes and reload the ui
    change_detection = {
      enabled = true,
      notify = false, -- don't get a notification when changes are found
    },

    -- install missing plugins on startup. This doesn't increase starting time
    install = {
      missing = true,
      -- try load colourscheme when starting an installation during startup
      colorscheme = {env_var_nvim_theme},
    },

  -- automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  },

--  require 'plugins.lsp',
--  require 'plugins.autocompletion',
--  require 'plugins.none-ls',
--  require 'plugins.indent-blankline',
--  require 'plugins.lazygit',
--  require 'plugins.comment',
-- require 'plugins.debug',
--  require 'plugins.database',
--  require 'plugins.misc',
--  require 'plugins.harpoon',
  -- require 'plugins.avante',
  -- require 'plugins.chatgpt',
--  require 'plugins.aerial',
--  require 'plugins.vim-tmux-navigator',
  ui = {
    -- If you have a Nerd Font, set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- Function to check if a file exists
local function file_exists(file)
  local f = io.open(file, 'r')
  if f then
    f:close()
    return true
  else
    return false
  end
end

-- Path to the session file
local session_file = '.session.vim'

-- Check if the session file exists in the current directory
if file_exists(session_file) then
  -- Source the session file
  vim.cmd('source ' .. session_file)
end

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

