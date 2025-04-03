---LudoPinelli/comment-box.nvim

return function()
    local opts = { noremap = true, silent = true } ---Used often when setting up keybinds.

    -- ╭─────────────────────────────────────────────────────────╮
    -- │ CB: Comment box.                                        │
    -- ╰─────────────────────────────────────────────────────────╯
    vim.keymap.set({ "n", "v"}, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)

    ---CBD: Comment box DELETE.
    vim.keymap.set({ "n", "v"}, "<Leader>cbd", "<Cmd>CBd<CR>", opts)

    ---
    ---CL: Comment Line
    ---──────────────────────────────────────────────────────────────────────
    vim.keymap.set({ "n", "v"}, "<Leader>cl", "<Cmd>CBline<CR>", opts)

    ---
    --──────────────────────────────────────────────────────────────────────
    --──────────────────────── CLT: Comment line text ──────────────────────
    --──────────────────────────────────────────────────────────────────────
    vim.keymap.set({ "n", "v"}, "<Leader>clt", "<Cmd>CBccline<CR>", opts)

end
