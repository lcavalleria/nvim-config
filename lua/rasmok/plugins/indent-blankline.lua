return {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = { "treesitter" },
	main = "ibl",
	opts = {
		indent = {
			char = "▏",
			highlight = { "LineNr" },
		},
		scope = { -- more visible line for the scope
			char = "▎",
			highlight = { "LineNr" },
			show_start = false,
			show_end = false,
		},
	},
}
