return {
  'f4z3r/gruvbox-material.nvim',
  name = 'gruvbox-material',
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd [[colorscheme gruvbox-material]]
  end,
}
