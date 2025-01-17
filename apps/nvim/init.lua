-- Options {{{
vim.g.netrw_liststyle = 3 -- display tree structure in NetRW
vim.g.have_nerd_font = true -- we have nerd fonts installed

local opt = vim.opt -- for conciseness

-- folding
opt.foldmethod = 'marker'

-- line numbering
opt.relativenumber = true
opt.number = true
opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor

-- tabbing and indentations
opt.tabstop = 2 -- 2 spaces for tabs
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting a new one

-- line wrapping
opt.wrap = false

-- show the cursorline
opt.cursorline = true

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case, assumes you want case sensitive

-- colour related settings
opt.termguicolors = true -- better colours on true colour terminals
opt.background = 'dark' -- default colourschemes to dark if they have both light and dark options.

-- gutter related settings
opt.signcolumn = 'yes' -- show sign column so that text in editor does not shift

-- backspace
opt.backspace = 'indent,eol,start' -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
opt.clipboard:append 'unnamedplus' -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- backup options
opt.swapfile = false
opt.backup = false

-- allow virtual editing in visual block mode
opt.virtualedit = 'block'

-- search highlight
opt.hlsearch = true

-- Autocommands
vim.api.nvim_create_augroup('custom_buffer', { clear = true })

-- highlight yanks
vim.api.nvim_create_autocmd('TextYankPost', {
  group = 'custom_buffer',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { timeout = 350 }
  end,
})
-- }}}

-- Keymaps {{{
-- leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- saving files
keymap.set('n', '<Leader>s', ':w<CR>:so %<CR>')
keymap.set('n', '<Leader>w', ':w<CR>')

-- folding
keymap.set('n', '<Tab>', 'za')

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }) not sure if I like this

-- clear search highlights
keymap.set('n', '<leader>nh', ':noh<CR>', opts, { desc = 'Clear search highlights' })

-- increment/decrement numbers
keymap.set('n', '<leader>+', '<C-a>', opts, { desc = 'Increment number' }) -- increment
keymap.set('n', '<leader>-', '<C-x>', opts, { desc = 'Decrement number' }) -- decrement

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', opts, { desc = 'Split window vertically' }) -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s', opts, { desc = 'Split window horizontally' }) -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=', opts, { desc = 'Make splits equal width and height' }) -- make split windows equal width and height
keymap.set('n', '<leader>sx', '<cmd>close<CR>', opts, { desc = 'Close current split' }) -- close current split window

-- Navigate between splits
keymap.set('n', '<C-k>', ':wincmd k<CR>', opts)
keymap.set('n', '<C-j>', ':wincmd j<CR>', opts)
keymap.set('n', '<C-h>', ':wincmd h<CR>', opts)
keymap.set('n', '<C-l>', ':wincmd l<CR>', opts)

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set('n', '<leader>do', function()
  diagnostics_active = not diagnostics_active

  if diagnostics_active then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end)

-- Diagnostic keymaps
keymap.set('n', '<leader>dp', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', '<leader>dn', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>df', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- }}}

-- Plugin Manager (mini.deps) {{{
-- Clone 'mini.nvim' manually in a way that it gets managed by 'mini.deps'
local path_package = vim.fn.stdpath 'data' .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'
if not vim.loop.fs_stat(mini_path) then
  vim.cmd 'echo "Installing `mini.nvim`" | redraw'
  local clone_cmd = {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/echasnovski/mini.nvim',
    mini_path,
  }
  vim.fn.system(clone_cmd)
  vim.cmd 'packadd mini.nvim | helptags ALL'
  vim.cmd 'echo "Installed `mini.nvim`" | redraw'
end

-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup { path = { package = path_package } }

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- }}}

-- Plugin: Gruvbox Colourscheme {{{
now(function()
  add {
    source = 'ellisonleao/gruvbox.nvim',
  }
  vim.cmd [[colorscheme gruvbox]]
end)
--}}}

-- Plugin: mini-icons {{{
now(function()
  require('mini.icons').setup()
end)
-- }}}

-- Plugin: mini-pairs {{{
now(function()
  require('mini.pairs').setup()
end)
-- }}}

-- Plugin: mini-diff {{{
now(function()
  require('mini.diff').setup()
end)
-- }}}

-- Plugin: mini-git {{{
now(function()
  require('mini.git').setup()
end)
-- }}}

-- plugin: mini-statusline {{{
now(function()
  require('mini.statusline').setup()
end)
-- }}}

-- Plugin: Treesitter {{{
later(function()
  add {
    source = 'nvim-treesitter/nvim-treesitter',
    -- run update after checkout
    hooks = {
      post_checkout = function()
        vim.cmd 'TSUpdate'
      end,
    },
  }
  require('nvim-treesitter.configs').setup {
    ensure_installed = { 'lua', 'vimdoc', 'markdown', 'markdown_inline' },
    highlight = { enable = true },
  }
end)
-- }}}

-- plugin: Treesitter-endwise {{{
later(function()
  add {
    source = 'rrethy/nvim-treesitter-endwise',
  }
  require('nvim-treesitter.configs').setup {
    endwise = {
      enable = true,
    },
  }
end)
-- }}}

-- Plugin: conform.nvim {{{
later(function()
  add {
    source = 'stevearc/conform.nvim',
  }
  require('conform').setup {
    formatters_by_ft = {
      lua = { 'stylua' },
      python = { 'ruff' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = 'fallback',
    },
  }
end)
--}}}

-- LSP {{{
now(function()
  add {
    source = 'neovim/nvim-lspconfig',
    -- Supply dependencies near target plugin
    depends = { 'williamboman/mason.nvim' },
  }
  require('lspconfig').lua_ls.setup {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = {
          globals = { 'vim', 'MiniDeps' },
        },
      },
    },
  }
  require('mason').setup {
    ui = {
      icons = {
        package_installed = '✓',
        package_pending = '➜',
        package_uninstalled = '✗',
      },
    },
  }
end)
-- }}}
