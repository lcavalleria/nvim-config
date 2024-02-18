return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local formatters = require("rasmok.tooling").formatters
		conform.setup({
			formatters_by_ft = formatters,
		})

		-- set keymaps
		require("rasmok.config.keymaps").formatting(conform, { lsp_fallback = false, async = false, timeout_ms = 500 })
	end,
}
