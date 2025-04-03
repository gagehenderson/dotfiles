---Disable netrw - I use nvim-tree instead.
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

---Force sign column to always be drawn, can help with random shakes caused
---by certain plugins.
vim.opt.signcolumn = "yes"

---Linespace
vim.opt.linespace = 3

--Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set highlight on search
vim.o.hlsearch = false

---Color column (column on the right side of the screen).
vim.o.colorcolumn = "80"

---Highlight the current cursor line.
vim.o.cursorline = true

---Fill in blanks (tabs, spaces..)
vim.opt.listchars = {
    -- eol      = '¬',
    -- space    = '⸱',
    -- trail    = '•',
    -- extends  = '…',
    -- precedes = '…',
}
vim.opt.list = false

---Share clipboard with system.
vim.api.nvim_set_option("clipboard", "unnamedplus")

---Set leader key.
vim.g.mapleader = " "
vim.g.maplocalleader = " "

---Better terminal colors.
vim.opt.termguicolors = true

---Show line numbers.
vim.wo.number = true
---Relative line numbers.
vim.wo.relativenumber = true

---Enable mouse
vim.o.mouse = "a"

---Tab spacing.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

---Disable wrapping.
vim.o.wrap = false

-- Force scroll to keep cursor within x lines.
vim.o.scrolloff = 7

