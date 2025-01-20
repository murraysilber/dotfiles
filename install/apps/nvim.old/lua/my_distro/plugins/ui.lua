return {

  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "echasnovski/mini.icons",
    lazy = true,
    opts = {},
    init = function()
      -- From https://github.com/LazyVim/LazyVim/blob/5115b585e7df4cedb519734ffc380b7e48a366f1/lua/lazyvim/util/mini.lua
      -- From https://github.com/LazyVim/LazyVim/blob/d35a3914bfc0c7c1000184585217d58a81f5da1a/lua/lazyvim/plugins/ui.lua#L310
      package.preload["nvim-web-devicons"] = function()
        require("mini.icons").mock_nvim_web_devicons()
        return package.loaded["nvim-web-devicons"]
      end
    end,
  },


  {
    "catgoose/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    keys = {
      { "<leader>ux", "<cmd>ColorizerToggle<cr>", desc = "Colorizer" },
    },
    opts = {},
  },
{
    "ellisonleao/gruvbox.nvim",
    lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'gruvbox'
  end,    
}
}
