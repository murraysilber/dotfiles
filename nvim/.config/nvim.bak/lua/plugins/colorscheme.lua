return {
  'sainnhe/gruvbox-material',
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    -- Do I want to test out another Gruvbox theme?
    vim.g.gruvbox_material_enable_italic = true
    vim.cmd.colorscheme('gruvbox-material')
  end
}
