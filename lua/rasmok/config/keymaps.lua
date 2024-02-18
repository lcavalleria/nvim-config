local M = {}

-- generic keymaps
M.global = function()
	local keymap = vim.keymap

	-- Directory navigation
	keymap.set("n", "<leader>m", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
	keymap.set("n", "<leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

	-- Pane navigation
	keymap.set("n", "<C-k>", "<C-w>k", opts) -- Navigate up
	keymap.set("n", "<C-h>", "<C-w>h", opts) -- Navigate left
	keymap.set("n", "<C-j>", "<C-w>j", opts) -- Navigate down
	keymap.set("n", "<C-l>", "<C-w>l", opts) -- Navigate right

	-- Window Management
	keymap.set("n", "<leader>sv", ":vsplit<CR>", opts) -- Split vertically
	keymap.set("n", "<leader>sh", ":split<CR>", opts) -- Split horizontally

	-- Telescope
	keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
	keymap.set("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
	keymap.set("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find keymaps" })
	keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags" })
	keymap.set("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in cwd" })
	keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffer" })

	-- Comment
	vim.api.nvim_set_keymap("n", "<leader>c", "gcc", { noremap = false }) -- Telescope buffers
	vim.api.nvim_set_keymap("v", "<leader>c", "gb", { noremap = false }) -- Telescope buffers

	-- Indenting (keep selection)
	keymap.set("v", "<", "<gv")
	keymap.set("v", ">", ">gv")
end

-- lsp keymaps
M.on_lsp_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap

	return function(client, bufnr)
		opts.buffer = bufnr

		opts.desc = "Show LSP references"
		keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
	end
end

M.formatting = function(conform, formatting_opts)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap

	opts.desc = "Format file or range (in visual mode)"
	keymap.set({ "n", "v" }, "<leader>l", function()
		conform.format(formatting_opts)
	end, opts)
end

M.linting = function(lint)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap

	opts.desc = "Format file or range (in visual mode)"
	keymap.set({ "n" }, "<leader>i", function()
		lint.try_lint()
	end, opts)
end

return M
