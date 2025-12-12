-- Options
vim.opt.compatible = false
vim.opt.number = true
vim.opt.relativenumber = true

-- Search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Timing settings
vim.opt.ttimeoutlen = 0
vim.opt.timeoutlen = 0
vim.opt.updatetime = 250

-- History and backspace
vim.opt.history = 1000
vim.opt.backspace = { "indent", "eol", "start" }

-- Buffer settings
vim.opt.hidden = true

-- UI settings
vim.opt.title = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.showtabline = 2

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Colors and UI
vim.opt.termguicolors = true
vim.opt.mouse = "a"

-- Clipboard
vim.opt.clipboard:append({ "unnamed", "unnamedplus" })

-- Completion
vim.opt.completeopt = { "menu", "menuone", "noinsert" }
vim.opt.pumheight = 10

-- File types
vim.cmd("filetype plugin indent on")
vim.cmd("syntax on")
