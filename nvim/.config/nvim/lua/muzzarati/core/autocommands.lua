--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- close certain widows with q rather than :q
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    'grug-far',
    'help',
    'man',
    'qf',
    'query',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = event.buf, silent = true })
  end,
  desc = 'close certain windows with q',
})

-- does not insert a comment on a new line if previous line was a comment.
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.opt.formatoptions:remove { 'c', 'r', 'o' }
  end,
  desc = 'Disable New Line Comment',
})

-- lsp attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('MuzzaratiGroup', { clear = true }),
  callback = function(e)
    local opts = { buffer = e.buf }
    vim.keymap.set('n', 'gd', function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set('n', 'K', function()
      vim.lsp.buf.hover()
    end, opts)
    vim.keymap.set('n', '<leader>vws', function()
      vim.lsp.buf.workspace_symbol()
    end, opts)
    vim.keymap.set('n', '<leader>vd', function()
      vim.diagnostic.open_float()
    end, opts)
    vim.keymap.set('n', '<leader>vca', function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set('n', '<leader>vrr', function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set('n', '<leader>vrn', function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set('i', '<C-h>', function()
      vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.goto_next()
    end, opts)
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.goto_prev()
    end, opts)
  end,
})
