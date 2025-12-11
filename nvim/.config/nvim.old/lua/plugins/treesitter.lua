return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			highlight = { enable = true },
			indent = { enable = true },
			autoage = { enable = true },
			ensure_installed = {
				"lua",
				"ruby",
				"elixir",
				"eex",
				"vim",
				"html",
				"javascript",
				"query",
				"vimdoc",
				"go",
				"python",
				"java", -- add whatever coding language that you use in your day-to-day
			},
			auto_install = false,
		})
	end,
}
