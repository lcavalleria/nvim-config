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

		-- assign keybinds on attach
		local on_attach = function(client, bufnr)
			require("rasmok.config.keymaps").on_lsp_attach(client, bufnr)
			-- TODO: move to autocmd 'LspAttach'?. Fix after 0.10 release (may have changed)
			if client.server_capabilities.inlayHintProvider then
				vim.lsp.inlay_hint.enable(bufnr, true)
			end
		end
		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		local lsps = require("rasmok.language-tools").lsps

		-- configure language servers
		for k, v in pairs(lsps) do
			lspconfig[k].setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = v,
			})
		end

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = require("rasmok.utils.icons").diagnostic_signs
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- set floating windows borders
		local border = { border = "rounded" }
		vim.diagnostic.config({ float = border })
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, border)
		vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, border)
	end,
}
