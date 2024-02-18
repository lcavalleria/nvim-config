return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- autocompletion. Needs to be added to the sources list of nvim-cmp
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- for name file refactoring
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- assign keybinds on attach

		local client = Nil -- TODO: assign real client
		local on_attach = require("rasmok.config.keymaps").on_lsp_attach(client, bufnr)

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = require("rasmok.utils.icons").diagnostic_signs
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- configure language servers
		-- Python
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
		})
		-- Lua
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = require("rasmok.plugins.lsp.settings.lua_ls"),
		})
	end,
}
