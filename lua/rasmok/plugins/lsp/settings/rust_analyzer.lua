return {
	["rust-analyzer"] = {
		diagnostics = { enable = true },
		inlayHints = { typeHints = { enable = true } },
		-- use clippy for linting
		checkOnSave = {
			allFeatures = true,
			overrideCommand = {
				"cargo",
				"clippy",
				"--workspace",
				"--message-format=json",
				"--all-features",
			},
		},
	},
}
