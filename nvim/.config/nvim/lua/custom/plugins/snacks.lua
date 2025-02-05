return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },

    dashboard = {
      enabled = true,
      sections = {
        { section = 'header' },
        { icon = ' ', title = 'Keymaps', section = 'keys', indent = 2, padding = 1 },
        { icon = ' ', title = 'Recent Files', section = 'recent_files', indent = 2, padding = 1 },
        { icon = ' ', title = 'Projects', section = 'projects', indent = 2, padding = 1 },
        { section = 'startup' },
      },
    },

    indent = {
      enabled = true,
      char = '|',
      animate = { enabled = false },
      indent = {
        only_current = true,
        only_scope = true,
      },
      scope = {
        enabled = true,
        only_current = true,
        only_scope = true,
        underline = false,
      },
      chunk = {
        enabled = false,
        only_current = true,
      },
      -- filter for buffers, turn off the indents for markdown
      filter = function(buf)
        return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == '' and vim.bo[buf].filetype ~= 'markdown'
      end,
    },
    -- picker = { enabled = true },
    --    input = { enabled = true },
    --  quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
  },
}
