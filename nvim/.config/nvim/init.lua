--[[     
  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Bootstrap lazy
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

-- Initialize lazy with dynamic loading of anything in the plugins directory
require('lazy').setup('plugins', {
  change_detection = {
    enabled = true, -- automatically check for config file changes and reload the ui
    notify = false, -- turn off notifications whenever plugin changes are made
  },
})

-- These modules are not loaded by lazy
require 'core.options'
require 'core.keymaps'
require 'core.autocmd'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
