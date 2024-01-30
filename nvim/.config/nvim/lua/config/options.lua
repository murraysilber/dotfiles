local opt = vim.opt

-- Session Management
opt.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Line Numbers
opt.relativenumber = true
opt.number = true

-- Indentation
opt.expandtab = true
opt.autoindent = true

-- Width of a tab
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

-- Use number of spaces to insert a <Tab>
opt.expandtab = true

-- Line Wrapping
opt.wrap = false

-- Search Settings
opt.ignorecase = true
opt.smartcase = true

-- Cursor Line
opt.cursorline = true
opt.cursorlineopt = "number"

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
vim.diagnostic.config {
    float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Enable the mouse while in nvim
opt.mouse = "a"


-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
opt.clipboard = 'unnamedplus'

-- Always keep 8 lines above/below cursor unless at start/end of file
opt.scrolloff = 999

-- Place a column line
-- opt.colorcolumn = "80"

-- Enable the sign column to prevent the screen from jumping
opt.signcolumn = "yes"
