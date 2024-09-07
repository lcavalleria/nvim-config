-- Plugins that need minimal configuration
return {
	{
		"nvim-tree/nvim-tree.lua",
		lazy = false,
		opts = {
			filters = { dotfiles = false, git_ignored = false },
			update_focused_file = { enable = true, update_root = true },
		},
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
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
