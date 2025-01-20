-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Setup plugins
require("lazy").setup({
  require(themes[env_var_nvim_theme]),
  require("plugins.treesitter"),
  require("plugins.misc"),
  require("plugins.vim-tmux-navigator")
})

require 'core.options'  -- Load general options
require 'core.keymaps'  -- Load general keymaps
require 'core.autocmds' -- Load Autocommands
