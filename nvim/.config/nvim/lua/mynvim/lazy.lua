-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy with dynamic loading of anything in the plugins directory
require("lazy").setup({
	{ import = "mynvim.plugins" }, -- main plugins directory
	{ import = "mynvim.plugins.lsp" }, -- lsp plugins directory
}, {
	install = {
		colorscheme = { "gruvbox" },
	},
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		enabled = true, -- automatically check for config file changes and reload the ui
		notify = true, -- turn off notifications whenever plugin changes are made
	},
})
