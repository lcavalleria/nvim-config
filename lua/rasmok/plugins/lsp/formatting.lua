return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local formatters = require("rasmok.language-tools").formatters
		conform.setup({
			formatters_by_ft = formatters,
		})

		-- set keymaps
		require("rasmok.config.keymaps").formatting(conform, { lsp_fallback = true, async = false, timeout_ms = 500 })
	end,
}
