local M = {}

M.lsps = { -- Key: Lsp Name. Value: Lsp Settings (can be empty)
  lua_ls = {require("rasmok.plugins.lsp.settings.lua_ls")},
	pyright = {},
  rust_analyzer = {},
}

M.formatters = {
	lua = { "stylua" },
	python = { "isort", "black" }, -- isort for imports, black for formatting
}

M.linters = {
	lua = { "luacheck" },
	python = { "pylint" },
}

return M
