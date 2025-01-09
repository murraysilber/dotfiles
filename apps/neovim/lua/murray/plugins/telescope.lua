return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    vim.keymap.set("n", "<leader>ff", require('telescope.builtin').find_files)
    vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags)
    vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep)
    vim.keymap.set("n", "<leader>en", function()
      require('telescope.builtin').find_files {
        cwd = vim.fn.stdpath("config")
      }
    end)
  end
}