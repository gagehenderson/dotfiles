
local transparency                    = 0.95
vim.g.neovide_hide_mouse_when_typing  = true
vim.g.neovide_scale_factor            = 1
vim.g.neovide_refresh_rate            = 250
vim.g.neovide_no_vsync                = true
vim.g.neovide_transparency            = transparency
--vim.o.guifont                         = "Cousine Nerd Font:h11"
--vim.o.guifont                         = "JetBrainsMono Nerd Font Mono:h11"
--vim.o.guifont                         = "GoMono Nerd Font Mono:h11"
vim.o.guifont                         = "CaskaydiaCove Nerd Font Mono:h11"
vim.g.transparency                    = transparency
-- vim.g.neovide_background_color        = "#32302F" -- Deprecated / doesn't function I believe.

---Disable all animations.
-- vim.g.neovide_cursor_animation_length = 0
-- vim.g.neovide_cursor_trail_length     = 0
-- vim.g.neovide_scroll_animation_length = 0

-- ╭─────────────────────────────────────────────────────────╮
-- │ Custom Keybinds:                                        │
-- ╰─────────────────────────────────────────────────────────╯
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
