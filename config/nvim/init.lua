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
                require('telescope').extensions.projects.projects({
                    attach_mappings = function(prompt_bufnr)
                        local actions = require('telescope.actions')
                        local action_state = require('telescope.actions.state')
                        local project_mod = require('project_nvim.project')
                        actions.select_default:replace(function()
                            local selected = action_state.get_selected_entry(prompt_bufnr)
                            if selected == nil then
                                actions.close(prompt_bufnr)
                                return
                            end
                            actions.close(prompt_bufnr)
                            project_mod.set_pwd(selected.value, "telescope")
                            vim.cmd("Explore " .. selected.value)
                        end)
                        return true
                    end,
                })
            end)
        end
    end,
})
