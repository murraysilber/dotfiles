return {
  'folke/todo-comments.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  cmd = { 'TodoTelescope' },
  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = {
    signs = false, -- hide icons in the signs column
  },

  -- TODO: Are keys mapped this way better?
  config = function()
    local todo_comments = require 'todo-comments'
    -- TODO: need to make sure we can manage keymaps
    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', ']t', function()
      todo_comments.jump_next()
    end, { desc = 'Next todo comment' })

    keymap.set('n', '[t', function()
      todo_comments.jump_prev()
    end, { desc = 'Previous todo comment' })

    keymap.set('n', '<leader>st', '<cmd>TodoTelescope<cr>', { desc = 'Search TODOs' })

    keymap.set('n', '<leader>sT', '<cmd>TodoTelescope keywords=TODO,FIX,FIXME,INFO,WARN<cr>', { desc = 'Search TODO/FIX/FIXME/INFO/WARN' })

    todo_comments.setup()
  end,
}
