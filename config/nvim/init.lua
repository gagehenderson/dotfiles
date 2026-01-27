package.path = package.path .. ";../?.lua"

local colorscheme = "gruvbox-material"
vim.g.transparency = 1
vim.g.neovide_transparency = 0.94
vim.o.guifont = "GoMono Nerd Font Mono:h11"

require("terminal-config")
require("scripts.init-plugins")
require("neovide-config")
require("vim-config")
require("keybinds")
require("daily-journals")

vim.cmd("colorscheme "..colorscheme)

-- Open project picker when starting Neovim without a file or directory
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        if vim.fn.argc() == 0 then
            vim.schedule(function()
                require('telescope').extensions.projects.projects{}
            end)
        end
    end,
})
