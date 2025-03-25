vim.g.neovide_hide_mouse_when_typing  = true
vim.g.neovide_scale_factor            = 1
vim.g.neovide_refresh_rate            = 250
vim.g.neovide_no_vsync                = true

if vim.g.neovide == true then
    ---Fullscreen.
    vim.api.nvim_set_keymap('n', '<F11>', ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
    ---Zoom / Scale factor.
    vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>",
        { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>",
        { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 1<CR>", { silent = true })
end
