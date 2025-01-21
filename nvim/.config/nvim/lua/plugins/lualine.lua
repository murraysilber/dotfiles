return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
  },
  lazy = false,
  event = { 'BufReadPost', 'BufNewFile', 'VeryLazy' },
  config = function()
    -- local icons = require("config.icons")
    require('lualine').setup {
      options = {
        theme = 'auto',
        refresh = {
          statusline = 100,
        },
        globalstatus = true,
        icons_enabled = true,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {
            'help',
            'Trouble',
            'spectre_panel',
            'toggleterm',
          },
          winbar = {},
        },
      },
      sections = {
        lualine_a = { { 'fancy_mode', width = 3 } },
        lualine_b = {
          { 'fancy_branch' },
          { 'fancy_diff' },
        },
        lualine_c = {
          { 'fancy_cwd', substitute_home = true },
          { 'filename' },
        },

        lualine_x = {
          { 'fancy_macro' },
          { 'fancy_diagnostics' },
          { 'fancy_searchcount' },
          { 'fancy_location' },
        },
        lualine_y = {
          { 'fancy_filetype', ts_icon = '' },
        },
        lualine_z = {
          { 'fancy_lsp_servers' },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        -- lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
    }
  end,
}
