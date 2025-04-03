local opts = { noremap = true, silent = true } ---Used often when setting up keybinds.

---Toggle file browser
--vim.keymap.set("n", "<leader>b", ":NvimTreeToggle<CR>", opts)

---Fuzzy finding in directory.
---Uses grep, only works on linux I think?
vim.keymap.set("n", "<C-s>", ":Telescope live_grep<CR>", opts)

---Search files
---Assumes you have telescope installed.
vim.keymap.set('n', '<C-p>', require('telescope.builtin').find_files, { desc = 'Search Files' })


---Copilot completion.
---C-CR = Ctrl + Enter.
---C-Tab = Control + Tab.
-- vim.keymap.set(
--     "i",
--     "<C-J>",
--     "copilot#Accept('<CR>')",
--     { noremap = true, silent = true, expr = true, replace_keycodes = false }
-- )

---Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

---Easily cycle through color schemes.
vim.keymap.set("n", "<C-c>", ":Telescope colorscheme<CR>", opts)

---LSPSaga floating terminal.
vim.keymap.set("n", "<C-t>", "<Cmd>Lspsaga term_toggle<CR>", opts)

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
