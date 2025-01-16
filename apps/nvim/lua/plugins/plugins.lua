-- Standalone plugins with less than 10 lines of config go here
return {
  
  {
    -- autoclose tags
    'windwp/nvim-ts-autotag',
  },
  
--  {
    -- Autoclose parentheses, brackets, quotes, etc.
--    'windwp/nvim-autopairs',
--    event = 'InsertEnter',
--    config = true,
--    opts = {},
--  },

  {
    -- Highlight todo, notes, etc in comments
    -- TODO: Need to do some stuff
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false },
  },

  {
    -- high-performance color highlighter
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },

  {
    -- add "end" in Ruby, Vimscript, Lua, etc.
    "rrethy/nvim-treesitter-endwise",
    config = function()
      -- Requires nvim-treesitter installed
      require('nvim-treesitter.configs').setup {
        endwise = {
          enable = true,
        },
      }
    end  
  },

}
