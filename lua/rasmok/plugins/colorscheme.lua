return {
	"rose-pine/neovim",
	name = "rose-pine",
	priority = 1000, -- load this first.
	config = function()
		-- load the colorscheme here
		-- To see all the hl names: ':Telescope highlights'
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

		-- Git signs
		vim.api.nvim_set_hl(0, "SignAdd", { fg = "#206020" })
		vim.api.nvim_set_hl(0, "SignChange", { fg = "#502090" })
		vim.api.nvim_set_hl(0, "SignDelete", { fg = "#802020" })
		vim.api.nvim_set_hl(0, "NvimTreeGitNew", { link = "SignAdd" })
		vim.api.nvim_set_hl(0, "NvimTreeGitDirty", { link = "SignChange" })

		-- Inlay Hints
		vim.api.nvim_set_hl(0, "LspInlayHint", { fg = "#504050", bg = "none" })
	end,
}
