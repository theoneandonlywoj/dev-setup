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

-- 
vim.opt.complete = ""
-- opt = vim.o
-- vim.api.nvim_set_option("clipboard", "unnamedplus")
-- Clipboard
-- opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"
--
-- -- Confirm to save changes before exiting modified buffer
-- opt.confirm = true
--
-- -- Use spaces instead of tabs
-- opt.expandtab = true
--
-- -- Enable mouse mode
-- opt.mouse = "a"
--
-- -- Print line number
-- opt.number = true
--
-- -- Round indent
-- opt.shiftround = true
--
-- -- Size of an indent
-- opt.shiftwidth = 2
--
-- -- Dont show mode since we have a statusline
-- opt.showmode = false
--
-- -- Spelling
-- opt.spelllang = { "en" }
--
-- -- Number of spaces tabs count for
-- opt.tabstop = 2
--
-- -- True color support
-- opt.termguicolors = true
