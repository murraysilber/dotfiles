return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  
  dependencies = {
    "windwp/nvim-ts-autotag",
  },

  config = function()
    local treesitter = require("nvim-treesitter.configs")
    
    treesitter.setup ({
      -- enable syntax highlighting
      highlight = {
        enable = true,
      },

      -- enable indentation
      indent = { enable = true },

      -- enable autotagging (using nvim-ts-autotag)
      autotag = { enable = true },

      -- ensure these language parsers are installed
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "dockerfile",
        "go",
        "python",
        "elixir",
        "css",
        "html",
        "javascript",
        "java",
        "yaml",
        "json",
        "xml",
        "markdown",
        "markdown_inline"
      }, 

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
      auto_install = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    })
  end,  

}
