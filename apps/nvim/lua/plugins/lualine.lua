return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
      local lualine = require("lualine")
      local lazy_status = require("lazy.status") -- to configure lazy pending updates count
      
    local diagnostics = {
        'diagnostics',
        sources = { 'nvim_diagnostic' },
        sections = { 'error', 'warn' },
        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
        colored = false,
        update_in_insert = false,
        always_visible = false,
        cond = hide_in_width,
    }

    local diff = {
      'diff',
      colored = false,
      symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
      cond = hide_in_width,
    }

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
              color = { fg = "#ff9e64" },
            },
            { 'encoding', cond = hide_in_width },
            { 'filetype', cond = hide_in_width } },
          },
      })
    end,  
} 

