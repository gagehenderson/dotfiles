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

-- Enable auto-indentation.
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.wrap = false

-- Force scroll to keep cursor within x lines.
vim.o.scrolloff = 7

-- Enable treesitter-based indentation for specific filetypes.
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "php", "javascript", "typescript", "lua", "html" },
    callback = function()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

