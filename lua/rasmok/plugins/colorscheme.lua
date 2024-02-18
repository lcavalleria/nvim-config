return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000, -- load this first.
	config = function()
		-- load the colorscheme here
		vim.cmd.colorscheme("rose-pine")
		-- background transparency
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalSB", { bg = "none" })
		-- float windows border transparency
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatTile", { bg = "none" })
		vim.api.nvim_set_hl(0, "FloatFooter", { bg = "none" })
	end,
}
