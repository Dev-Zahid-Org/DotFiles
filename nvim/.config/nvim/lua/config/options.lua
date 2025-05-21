-- Set <Space> as leader key
vim.g.mapleader = " "

-- Encoding
vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- UI Settings
vim.opt.number = true
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true

-- Status line & command line
vim.opt.laststatus = 3 -- Global statusline
vim.opt.cmdheight = 0 -- Hide cmd line when not in use
vim.opt.showcmd = false -- Deprecated, not needed with modern UI

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.breakindent = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- File behavior
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backspace = { "start", "eol", "indent" }

-- Splits
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.splitkeep = "cursor"

-- Mouse
vim.opt.mouse = "" -- Disabled (can set to "a" to enable)

-- Wildignore & path
vim.opt.path:append({ "**" }) -- Recursive search
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Format options
vim.opt.formatoptions:append({ "r" }) -- Continue comments with `r`

-- Completion experience
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Clipboard
vim.opt.clipboard = "unnamedplus"
