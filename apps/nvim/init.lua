print("Advent of neovim")

-- Bootstrap Lazy
require("config.lazy")

-- set default indentation. Use after/ftplugin to create options for each file type
vim.opt.shiftwidth = 4

-- Use system clipboard
vim.opt.clipboard = "unnamedplus"

-- source the current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")

-- source the current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")

-- source selected lines (Visual mode)
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
-- Try it with yap in Normal mode
-- See ':help vim.highlight.on._yank()'
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end,
})

          vim.o.background = "dark" -- or "light" for light mode

