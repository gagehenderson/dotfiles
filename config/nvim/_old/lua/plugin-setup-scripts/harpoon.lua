local harpoon = require("harpoon")

local opts = { noremap = true, silent = true } ---Used often when setting up keybinds.

harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})

---Add a new entry to the list of buffers
opts.desc = "Harpoon Append: Append a new entry to the list of buffers"
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, opts)
opts.desc = "Harpoon Prepend: Prepend a new entry to the list of buffers"
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prepend() end, opts)

---View entire list of buffers.
opts.desc = "Harpoon Show: View entire list of buffers"
vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)

opts.desc = "Harpoon First: Go to 1st entry in list of buffers"
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, opts)
opts.desc = "Harpoon Second: Go to 2nd entry in list of buffers"
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, opts)
opts.desc = "Harpoon Third: Go to 3rd entry in list of buffers"
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, opts)
opts.desc = "Harpoon Fourth: Go to 4th entry in list of buffers"
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, opts)
opts.desc = "Harpoon Fifth: Go to 5th entry in list of buffers"
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, opts)
opts.desc = "Harpoon Sixth: Go to 6th entry in list of buffers"
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, opts)
opts.desc = "Harpoon Seventh: Go to 7th entry in list of buffers"
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, opts)
opts.desc = "Harpoon Eighth: Go to 8th entry in list of buffers"
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, opts)
opts.desc = "Harpoon Ninth: Go to 9th entry in list of buffers"
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, opts)

---Toggle previous & next buffers stored within Harpoon list
opts.desc = "Harpoon H (Like vim motion): Go to previous buffer in list"
vim.keymap.set("n", "<leader>h", function() harpoon:list():prev() end, opts)
opts.desc = "Harpoon L (Like vim motion): Got to next buffer in list"
vim.keymap.set("n", "<leader>l", function() harpoon:list():next() end, opts)

