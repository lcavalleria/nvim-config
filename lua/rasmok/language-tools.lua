local M = {}

M.treesitter = { -- Languages we want to install in treesitter
	"python",
	"json",
	"yaml",
	"bash",
	"lua",
	"gitignore",
	"rust",
	"markdown",
	"vimdoc",
	"html",
}

M.lsps = { -- Key: Lsp Name. Value: Lsp Settings (can be empty)
	lua_ls = require("rasmok.plugins.lsp.settings.lua_ls"),
	pyright = {},
	rust_analyzer = require("rasmok.plugins.lsp.settings.rust_analyzer"), -- also handles formatting and linting
}

M.formatters = {
	lua = { "stylua" },
	python = { "isort", "black" }, -- isort for imports, black for formatting
}

M.linters = {
	--	lua = { "luacheck" },
	python = { "pylint" },
}

return M
