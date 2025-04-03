package.path = package.path .. ";../?.lua" ---Used to help source files in subdirectories.

-- This is a file required if we are currently in an instance of Neovim via
-- the "VSCode Neovim" extension: https://github.com/vscode-neovim/vscode-neovim

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
vim.api.nvim_set_option("clipboard", "unnamedplus")
vim.opt.clipboard:append("unnamedplus")

---Enable mouse
vim.o.mouse = "a"

---Tab spacing.
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Force scroll to keep cursor within x lines.
vim.o.scrolloff = 7

-- ╭─────────────────────────────────────────────────────────╮
-- │ Plugin initialization and setup:                        │
-- ╰─────────────────────────────────────────────────────────╯
require("init-plugins-vscode")
require("plugin-setup-scripts.zen-mode")
require("plugin-setup-scripts.harpoon")
require("leap").create_default_mappings()

-------------------
-- Keybinds
------------------
local opts = { noremap = true, silent = true }
---Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

---Tabularize.
---Easy align to equals shortcut.
vim.keymap.set("v", "<leader>a", ":Tabularize /=<CR>", opts)

-- Quickly search / replace on current line/selection - Or in entire buffer.
vim.keymap.set({ "n", "v" }, "<leader>s", ":s/", opts)
vim.keymap.set({ "n", "v" }, "<leader>S", ":%s/", opts)

-- ╭─────────────────────────────────────────────────────────╮
-- │ CB: Comment box.                                        │
-- ╰─────────────────────────────────────────────────────────╯
vim.keymap.set({ "n", "v"}, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)

---CBD: Comment box DELETE.
vim.keymap.set({ "n", "v"}, "<Leader>cbd", "<Cmd>CBd<CR>", opts)

---CL: Comment Line
---──────────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v"}, "<Leader>cl", "<Cmd>CBline<CR>", opts)

--──────────────────────────────────────────────────────────────────────
--──────────────────────── CLT: Comment line text ──────────────────────
--──────────────────────────────────────────────────────────────────────
vim.keymap.set({ "n", "v"}, "<Leader>clt", "<Cmd>CBccline<CR>", opts)
