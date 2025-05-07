-- This file contains non-foundational plugins that I will probably be messing
-- with, adding or removing fairly often.
--
-- All plugin files are referenced in scripts.init-plugins.lua
return {
    -- Lualine, uncomment when I actually have a use for it.
    -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --     end
    -- },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = require("plugin-configs.harpoon-config"),
    },
    {
        "xiyaowong/transparent.nvim",
        config = function()
            require("transparent").setup({})
        end
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            dashboard    = { enabled = false },
            input        = { enabled = false },
            scope        = { enabled = false },
            scroll       = { enabled = false },
            words        = { enabled = false },
            explorer     = { enabled = false },
            picker       = { enabled = false },
            bigfile      = { enabled = true },
            indent       = { enabled = true },
            quickfile    = { enabled = true },
            statuscolumn = { enabled = true },
            notifier     = {
                enabled = true,
                timeout = 3000,
            },
            zen = {
                enabled = true,
                toggles = {
                    dim = false,
                },
            }
        },
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
    },
    { "godlygeek/tabular" },
    { "gelguy/wilder.nvim" },
    { "folke/which-key.nvim" },
    {
        "ggandor/leap.nvim",
        lazy = false,
        config = function()
            require('leap').create_default_mappings()
        end
    },
    {
        "supermaven-inc/supermaven-nvim",
        config = function()
            require("supermaven-nvim").setup({
                keymaps = {
                    accept_suggestion = "<C-j>",
                    accept_word = "<Tab>"
                }
            })
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        config = function()
            require("toggleterm").setup()
        end,
    },
    { "LudoPinelli/comment-box.nvim" },
    {
        "andweeb/presence.nvim",
        config = function()
            require("presence").setup({
                auto_refresh = true,
            })
        end
    },
}
