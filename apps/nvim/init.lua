vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.o.background = "dark" -- or "light" for light mode

-- Bootstrap lazy.nvim
require("config.lazy")
