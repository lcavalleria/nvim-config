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
	"sql",
	"json",
}

M.mason_lsps = { -- Key: Lsp Name. Value: Lsp Settings (can be empty)
	-- TODO: automate the required path from lsp name
	lua_ls = require("rasmok.plugins.lsp.settings.lua_ls"),
	pyright = {},
	rust_analyzer = require("rasmok.plugins.lsp.settings.rust_analyzer"), -- also handles formatting and linting
	sqlls = {},
}

M.external_lsps = { -- Lsps not in Mason
	jdtls = {}, -- java
	metals = {}, -- scala
}

M.formatters = {
	lua = { "stylua" },
	python = { "isort", "black" }, -- isort for imports, black for formatting
	sql = { "sqlfmt" },
	json = { "jq" },
}

M.linters = {
	-- lua = { "luacheck" },
	python = { "flake8", "mypy" },
	sql = { "sqlfluff" },
}

return M
