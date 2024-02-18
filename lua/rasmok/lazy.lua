-- install lazy if not installed
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

require("rasmok.config.globals")
require("rasmok.config.keymaps").global()
require("rasmok.config.options")

local plugins = {
	-- directories
	spec = {
		{ import = "rasmok.plugins" },
		{ import = "rasmok.plugins.lsp" },
	},
	-- ui
	ui = {
		border = "rounded",
	},
}

local opts = {
	defaults = {
		lazy = true,
	},
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"tarPlugin",
			"tohtml",
			"zipPlugin",
			"netrw", -- Required to disable by nvim-tree
			"ntrwPlugin", -- Required to disable by nvim-tree
		},
	},
	change_detection = {
		notify = true,
	},
}

require("lazy").setup(plugins, opts)
