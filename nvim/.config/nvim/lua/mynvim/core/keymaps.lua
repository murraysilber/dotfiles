local opts = { noremap = true, silent = true }

-- local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
-- local map = vim.keymap.set -- for conciseness

-- This has to be set before initializing lazy
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Spelling
vim.keymap.set("n", "<C-s>", function()
    require("telescope.builtin").spell_suggest(require("telescope.themes").get_cursor({
        previewer = false,
        layout_config = {
            width = 50,
            height = 15,
        }
    })
    )
end, { remap = true })
-- vim.keymap.set("n", "<C-s>", "z=", { remap = true})
-- keymap("n", "<C-s>", "<cmd>Telescope spell_suggest<cr>", { remap = true})

-- Kill search highlights
keymap("n", "<CR>", ":noh<CR>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files({ no_ignore = true }) end, {})

-- vim.keymap.set("n", "<leader>ff", function()
--     require('telescope.builtin').find_files(require('telescope.themes').get_cursor({ previewer = true })
--     )
-- end, { remap = true })


vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep({ no_ignore = true }) end, {})

vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers({ no_ignore = true }) end, {})

vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags({ no_ignore = true }) end, {})

-- Toggle comments
-- keymap('n', '<C-Bslash>', '<Plug>(comment_toggle_linewise_current)', opts)
-- keymap('x', '<C-Bslash>', '<Plug>(comment_toggle_linewise_visual)', opts)
