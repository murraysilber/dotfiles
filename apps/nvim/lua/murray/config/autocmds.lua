-- Highlight when yanking (copying) text
-- Try it with yap in Normal mode
-- See ':help vim.highlight.on._yank()'
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = "highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
