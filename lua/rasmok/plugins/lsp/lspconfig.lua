local table_utils = require("rasmok.utils.table_utils")
local on_attach = require("rasmok.language-tools").on_attach
local concat = table_utils.concat
local table_to_string = table_utils.table_to_string

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- autocompletion. Needs to be added to the sources list of nvim-cmp
		{ "antosha417/nvim-lsp-file-operations", config = true }, -- for name file refactoring
	},
	opts = {
		inlay_hints = { enabled = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local language_tools = require("rasmok.language-tools")
		local lsps = concat(language_tools.mason_lsps, language_tools.external_lsps)

		-- configure language servers
		for k, v in pairs(lsps) do
			lspconfig[k].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = v,
			})
		end

		vim.lsp.inlay_hint.enable(true)

		-- Change the Diagnostic symbols in the sign column
		local signs = require("rasmok.utils.icons").diagnostic_signs
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- set floating windows borders
		vim.diagnostic.config({ float = { source = true, border = "rounded" } })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	end,
}
