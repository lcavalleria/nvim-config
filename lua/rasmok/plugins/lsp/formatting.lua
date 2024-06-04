return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		local normalize = require("rasmok.utils.string_utils").hyphens_to_underscores
		local formatters = require("rasmok.language-tools").formatters
		local table_map = require("rasmok.utils.table_utils").map_values
		local formatters_normalized = table_map(formatters, normalize)
		conform.setup({
			formatters_by_ft = formatters_normalized,
		})

		-- set keymaps
		require("rasmok.config.keymaps").formatting(conform, { lsp_fallback = true, async = false, timeout_ms = 500 })
	end,
}
