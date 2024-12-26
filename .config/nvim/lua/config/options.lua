-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Do NOT hide deprecation warnings
vim.g.deprecation_warnings = false

-- Limiting the waiting time to 500ms
vim.opt.timeoutlen = 500

-- Number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 8

-- Better editor UI
vim.opt.number = true
vim.opt.numberwidth = 3
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes:1'
vim.opt.cursorline = true

-- More clear text formatting
vim.opt.list = true
vim.opt.listchars = 'space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,leadmultispace:│   ,'

-- Remember 50 items in commandline history
vim.opt.history = 50

-- Preserve view while jumping
vim.opt.jumpoptions = 'view'

-- 
vim.opt.complete = ""

-- Confirm to save changes before exiting modified buffer
vim.opt.confirm = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Print line number
vim.opt.number = true

-- Round indent
vim.opt.shiftround = true

-- Size of an indent
vim.opt.shiftwidth = 2

-- Dont show mode since we have a statusline
-- vim.opt.showmode = false

-- Spelling
vim.opt.spelllang = { "en" }

-- Number of spaces tabs count for
vim.opt.tabstop = 2

-- True color support
vim.opt.termguicolors = true
