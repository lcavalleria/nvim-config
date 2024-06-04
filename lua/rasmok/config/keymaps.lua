local M = {}

local Map = function(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts) -- Force opts passed by parameters if collision
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

local function close_floating()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

-- generic keymaps
M.global = function()
	-- Directory navigation
	Map("n", "<leader>m", ":NvimTreeFocus<CR>", { desc = "Navigate file tree" })
	Map("n", "<leader>f", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })

	-- Pane navigation
	Map("n", "<C-k>", "<C-w>k", { desc = "Navigate pane up" })
	Map("n", "<C-h>", "<C-w>h", { desc = "Navigate pane left" })
	Map("n", "<C-j>", "<C-w>j", { desc = "Navigate pane down" })
	Map("n", "<C-l>", "<C-w>l", { desc = "Navigate pane down" })

	-- Window Management
	Map("n", "<leader>sv", ":vsplit<CR>", { desc = "Split vertically" })
	Map("n", "<leader>sh", ":split<CR>", { desc = "Split horizontally" })
	Map("n", "<Esc>", close_floating, { desc = "Close all flating windows" })

	-- Telescope
	Map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
	Map("n", "<leader>fr", ":Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
	Map("n", "<leader>fk", ":Telescope keymaps<CR>", { desc = "Find keymaps" })
	Map("n", "<leader>fh", ":Telescope help_tags<CR>", { desc = "Find help tags" })
	Map("n", "<leader>fs", ":Telescope live_grep<CR>", { desc = "Find string in cwd" })
	Map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Find buffer" })

	-- Comment
	Map("n", "<leader>c", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment line", noremap = false })
	Map("v", "<leader>c", "<Plug>(comment_toggle_blockwise_visual)", { desc = "Comment selection", noremap = false })

	-- Indenting (keep selection)
	Map("v", "<", "<gv", { desc = "Decrease indentation level" })
	Map("v", ">", ">gv", { desc = "Increase indentation level" })
end

-- lsp keymaps
M.on_lsp_attach = function(client, bufnr) -- client unused, keep here as a reminder that it may be useful
	-- Map("n", "<leader>gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Show LSP references (Buffer)" }) -- replaced by telescope
	Map(
		"n",
		"<leader>gr",
		"<cmd>Telescope lsp_references<CR>",
		{ buffer = bufnr, desc = "Show LSP references (Telescope)" }
	)
	Map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Smart rename" })
	Map("n", "<leader>gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
	Map("n", "<leader>gi", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Go to implementation" })
	Map({ "n", "i" }, "<C-p>", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Show signature help" })
	Map("n", "<leader>i", vim.diagnostic.open_float, { desc = "Show diagnostic float" })
end

M.formatting = function(conform, formatting_opts)
	Map({ "n", "v" }, "<leader>ll", function()
		conform.format(formatting_opts)
	end, { desc = "Format file or range (in visual mode)" })
end

M.linting = function(lint)
	Map({ "n" }, "<leader>l", function()
		lint.try_lint()
	end, { desc = "Apply linting" })
end

return M
