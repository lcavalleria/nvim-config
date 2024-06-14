return {
	Lua = {
		-- make the language server recognize "vim" global
		diagnostics = {
			globals = { "vim" },
		},
		hint = { enable = true },
		workspace = {
			-- make language server aware of runtime files
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.stdpath("config") .. "/lua"] = true,
			},
		},
	},
}
