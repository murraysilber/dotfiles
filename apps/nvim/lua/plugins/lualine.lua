return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      
    local hide_in_width = function()
      return vim.fn.winwidth(0) > 100
    end

      lualine.setup({
        options = {
          theme = "gruvbox-material",
          icons_enabled = true,
        },
        
        sections = {
          lualine_x = {
            {
              lazy_status.updates,
              cond = lazy_status.has_updates,
              color = { fg = "#fe8019" },
            },
            { 'encoding', cond = hide_in_width },
            { 'filetype', cond = hide_in_width } },
          },
      })
    end,  
} 

