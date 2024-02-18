return { -- highlight words wich cursor is on
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require("illuminate").configure({})
		vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorColumn" })
		vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorColumn" })
		vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorColumn" })
		--- auto update the highlight style on colorscheme change
		vim.api.nvim_create_autocmd({ "ColorScheme" }, {
			pattern = { "*" },
			callback = function(ev)
				vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "CursorColumn" })
				vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "CursorColumn" })
				vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "CursorColumn" })
			end,
		})
	end,
}
