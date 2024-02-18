local M = {}

M.lsps = {
	"lua_ls",
	"pyright",
  "rust_analyzer"
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
