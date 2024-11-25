local table_utils = require("rasmok.utils.table_utils")
local flatten = table_utils.flatten
local values_of = table_utils.values_of

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		-- import mason-tool-installer
		local mason_tool_installer = require("mason-tool-installer")

		--enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local tools = require("rasmok.language-tools")

		local tools_to_install = flatten(values_of(flatten({ flatten(tools.formatters), flatten(tools.linters) })))

		mason_tool_installer.setup({
			ensure_installed = tools_to_install,
			-- debounce_hours = 24,
			auto_update = true,
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = tools.mason_lsps,
			-- auto-install configured servers (with lspconfig)
			automatic_installation = true,
		})
	end,
}
