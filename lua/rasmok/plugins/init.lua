-- Plugins that need minimal configuration
return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = { filters = { dotfiles = true } },
	},
	"folke/which-key.nvim",
	{ -- Comments
		"numToStr/Comment.nvim",
		opts = {
			mappings = false, -- no mappings, set in keymaps.lua
		},
		lazy = false,
	},
	"nvim-tree/nvim-web-devicons", -- nvim tree icons
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = { window = { winblend = 0 } },
			integration = { ["nvim-tree"] = { enable = true } },
		},
	},
}
