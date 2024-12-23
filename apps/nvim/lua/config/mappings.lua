vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap for netRw
vim.keymap.set("n", "<space>pv", vim.cmd.Ex)

-- source the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- source the current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- source selected lines (Visual mode)
vim.keymap.set("v", "<space>x", ":lua<CR>")
