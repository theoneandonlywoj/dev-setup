-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- LazyVim auto format
vim.g.autoformat = true

-- LazyVim root dir detection
-- Each entry can be:
-- * the name of a detector function like `lsp` or `cwd`
-- * a pattern or array of patterns like `.git` or `lua`.
-- * a function with signature `function(buf) -> string|string[]`
vim.g.root_spec = { "lsp", { ".git", "lua", ".mix" }, "cwd" }

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

-- Wrap the line
vim.opt.wrap = true

-- Enable mouse mode
vim.opt.mouse = "a"

-- Print line number
vim.opt.number = true

-- Round indent
vim.opt.shiftround = true

-- Size of an indent
vim.opt.shiftwidth = 2

-- Dont show mode since we have a statusline
vim.opt.showmode = false

-- Spelling
vim.opt.spelllang = { "en" }

-- Number of spaces tabs count for
vim.opt.tabstop = 2

-- True color support
vim.opt.termguicolors = true

-- Scroll offset
vim.opt.scrolloff = 20

-- Do not use swapfiles
vim.opt.swapfile = false

-- Clipboard
vim.opt.clipboard = "unnamedplus"