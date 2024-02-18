config = function()
	require("nvim-treesitter.configs").setup({
		indent = { enable = true },
		autotag = { enable = true },
		ensure_installed = { -- language syntax we want to install
			"python",
			"json",
			"yaml",
			"bash",
			"lua",
			"gitignore",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = true,
		},
	})
end

return {
	"nvim-treesitter/nvim-treesitter",
	name = "treesitter",
	lazy = false,
	config = config,
}
