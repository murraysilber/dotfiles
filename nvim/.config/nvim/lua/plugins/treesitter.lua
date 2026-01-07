return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  opts = {
    ensure_installed = {
      "bash",
      "vimdoc",
      "html",
      "json",
      "lua",
      -- "markdown",
      -- "markdown_inline",
      "python",
      "query",
      "regex",
      "vim",
      "yaml",
      "go",
      "bicep",
      "terraform",
      "c_sharp",
      "elixir",
      "eex",
      "ruby",
    },
    -- Disable terraform treesitter on fixture files
    highlight = {
      disable = function(lang)
        local buf_name = vim.fn.expand("%")
        if lang == "terraform" and string.find(buf_name, "fixture") then
          return true
        end
      end,
    },
  },
}
