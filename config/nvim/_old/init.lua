package.path = package.path .. ";../?.lua" ---Used to help source files in subdirectories.


---Load config specific for the VSCode Neovim extension.
---Return so we don't load the rest of this config file.
---https://github.com/vscode-neovim/vscode-neovim
if vim.g.vscode then
    require("vscode-nvim-init")
    return
end


---Default colorscheme.
local colorscheme = "gruvbox-material"

---General vim configuration / options.
require("vim-options")

---Keybinds for building/running current directory.
require("run-project")


-- ╭─────────────────────────────────────────────────────────╮
-- │ Plugin initialization and setup:                        │
-- ╰─────────────────────────────────────────────────────────╯
require("init-plugins")
require("init-lsp")
require("plugin-setup-scripts.telescope")
require("plugin-setup-scripts.treesitter")
require("plugin-setup-scripts.nvim-cmp")
-- require("plugin-setup-scripts.no-neck-pain")
require("plugin-setup-scripts.zen-mode")
require("plugin-setup-scripts.harpoon")
--require("plugin-setup-scripts.barbar")

-- require("love2d").setup({})
require("leap").create_default_mappings()
require("lualine").setup({})
require("wilder").setup({ modes = { ":", "/", "?" } })
-- require("ibl").setup() -- An update caused this to start erroring my whole nvim. If re-enabling, make sure to also uncomment in plugin-list.lua.
-- require("typescript-tools").setup({})
require("transparent").setup({})


---General keybinds.
require("keybinds")

---Neovide (A Neovim GUI) configuration.
---https://github.com/neovide/neovide
require("neovide-config")

-- Set default color scheme.
vim.cmd("colorscheme " .. colorscheme)
