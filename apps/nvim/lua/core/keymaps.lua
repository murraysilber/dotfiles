-- leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- For conciseness
local opts = { noremap = true, silent = true }
local keymap = vim.keymap

-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }) not sure if I like this

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", opts, { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", opts, { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", opts, { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", opts, { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", opts, { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", opts, { desc = "Make splits equal width and height" }) -- make split windows equal width and height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", opts, { desc = "Close current split" }) -- close current split window

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
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
keymap.set('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
