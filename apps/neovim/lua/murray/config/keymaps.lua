vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap -- for conciseness

-- keymap for netRw
keymap.set("n", "<space>pv", vim.cmd.Ex)

-- source the current file
keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- source the current line
keymap.set("n", "<space>x", ":.lua<CR>")

-- source selected lines (Visual mode)
keymap.set("v", "<space>x", ":lua<CR>")

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })     -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })   -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })      -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window
