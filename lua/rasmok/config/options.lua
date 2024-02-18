local opt = vim.opt

-- Formatting
opt.tabstop = 2 -- Spaces of tab character
opt.shiftwidth = 2 -- Spaces for each level of indentation
opt.softtabstop = 2 -- Spaces for tab in insert mode
opt.expandtab = true -- Convert tab into spaces
opt.smartindent = true -- Auto indent
opt.wrap = false -- Let long lines go beyond the edge of the window
opt.iskeyword:append("-") -- Count '-' as part of the word
opt.formatoptions:remove({ "r", "o" })

-- Search
opt.incsearch = true -- Highlight matches dynamically while typing
opt.ignorecase = true -- Obvious
opt.smartcase = true -- Don't ignore case if we match both cases.
opt.hlsearch = false -- No highlight on searches

-- Appearence
opt.number = true
opt.relativenumber = true -- Set number lines relative to current one
opt.termguicolors = true -- Allow full color support. Required by some plugins.
opt.colorcolumn = "120" -- Line length indicator
opt.signcolumn = "yes" -- Keep necesary space for useful icons (debug, etc.)
opt.cmdheight = 1 -- Number of lines taken by nvim commands (':')
opt.scrolloff = 10 -- Start scrolling before we reach bot/top of the screen
opt.completeopt = "menuone,noinsert,noselect" -- Autocompletion behaviour

-- Behaviour
opt.hidden = true -- Change buffers without saving
opt.errorbells = false -- Annoying
opt.swapfile = false -- No swapfile
opt.backup = false -- no backup files
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true -- New panes on the right
opt.splitbelow = true -- New panes on the bottom
opt.autochdir = false -- Dont change directory we are in
opt.clipboard:append("unnamedplus") -- Allow copy to clipboard
opt.modifiable = true -- Allow the current buffer
opt.encoding = "UTF-8"
