-- Plugins that need minimal configuration
return {
	"folke/which-key.nvim",
	{ -- Comments
		"numToStr/Comment.nvim",
		mappings = { basic = true },
		config = true,
	},
	"nvim-tree/nvim-web-devicons", -- nvim tree icons
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
	},
}
