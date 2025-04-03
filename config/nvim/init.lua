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

vim.cmd("colorscheme "..colorscheme)
