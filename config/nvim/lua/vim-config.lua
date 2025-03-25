-- Force sign column to always be drawn, can help with random shakes caused
-- by certain plugins.
vim.opt.signcolumn = "yes"

vim.api.nvim_set_option("clipboard", "unnamedplus")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Case-insensitive searching UNLESS \C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set highlight on search.
vim.o.hlsearch = false

-- Guide column.
vim.o.colorcolumn = "80"

-- Highlight the current cursor line.
vim.o.cursorline = true

-- Fill in blanks (tabs, spaces..).
-- Setting vim.opt.list disables this (Which I recommend).
vim.opt.listchars = {
    -- eol      = '¬',
    -- space    = '⸱',
    -- trail    = '•',
    -- extends  = '…',
    -- precedes = '…',
}
vim.opt.list = false


---Better terminal colors.
vim.opt.termguicolors = true

-- Show line numbers.
vim.wo.number = true

-- Relative line numbers.
vim.wo.relativenumber = true

-- Enable mouse
vim.o.mouse = "a"

-- Tab spacing.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.wrap = false

-- Force scroll to keep cursor within x lines.
vim.o.scrolloff = 7

