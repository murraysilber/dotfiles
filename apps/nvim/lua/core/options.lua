vim.g.netrw_liststyle = 3 -- display tree structure in NetRW

local opt = vim.opt -- for conciseness

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
opt.background = "dark" -- default colourschemes to dark if they have both light and dark options. 

-- gutter related settings
opt.signcolumn = "yes" -- show sign column so that text in editor does not shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- backup options
opt.swapfile = false
opt.backup = false

-- allow virtual editing in visual block mode
opt.virtualedit = "block"

-- search highlight
opt.hlsearch = true

-- Autocommands
vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
  group    = "custom_buffer",
  pattern  = "*",
  callback = function() vim.highlight.on_yank { timeout = 350 } end
})


