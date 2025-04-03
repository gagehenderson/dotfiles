local nnp = require("no-neck-pain")

---Keybind to toggle.
---z for "zen mode"...
vim.keymap.set("n", "<leader>z", "<cmd>NoNeckPain<cr>", { noremap = true, silent = true })
nnp.setup({
    ---Default is 100 (kind of small on 1440)
    width = 100,

    ---
    ---Turn padding into scratchpad for notes.
    buffers = {
        scratchPad = {
            -- set to `false` to
            -- disable auto-saving
            enabled = true,
            -- set to `nil` to default 
            -- to current working directory
            location = "~/Documents/",
        },
        bo = {
            filetype = "md"
        },
    },
})
