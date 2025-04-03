-- This is a file required if we are currently in an instance of Neovim via
-- the "VSCode Neovim" extension: https://github.com/vscode-neovim/vscode-neovim
--

---Force sign column to always be drawn, can help with random shakes.
vim.opt.signcolumn = "yes"

--Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set highlight on search
vim.o.hlsearch = false

---Color column (column on the right side of the screen).
vim.o.colorcolumn = "80"

---Share clipboard with system.
vim.opt.clipboard:append("unnamedplus")

---Enable mouse
vim.o.mouse = "a"

---Tab spacing.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Force scroll to keep cursor within x lines.
vim.o.scrolloff = 7

