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
        -- Upstream moved off GitHub Jan 2026; the original
        -- ggandor/leap.nvim repo is frozen and warns on launch.
        url = "https://codeberg.org/andyg/leap.nvim",
        name = "leap.nvim",
        lazy = false,
        config = function()
            -- Codeberg fork renamed `create_default_mappings` to
            -- `add_default_mappings`.
            require('leap').add_default_mappings()
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
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup({
                -- Detect projects by these markers
                patterns = { ".git", "package.json", "Cargo.toml", "*.sln" },
                -- Use Telescope for the picker
                detection_methods = { "pattern", "lsp" },
            })
        end,
    },
    { "LudoPinelli/comment-box.nvim" },
    {
        -- glaude.nvim: multi-session Claude Code manager. Local dev
        -- repo at ~/Personal Projects/glaude. Switch to a github
        -- spec when the plugin is stable enough to consume from
        -- main without pulling unfinished changes.
        dir = vim.fn.expand("~/Personal Projects/glaude"),
        cmd = {
            "Glaude", "GlaudeNew", "GlaudeSend", "GlaudeList",
            "GlaudeNext", "GlaudePrev", "GlaudeResume", "GlaudeRename",
            "GlaudeInfo", "GlaudeUsage", "GlaudeRestart", "GlaudeColor",
            "GlaudeSidebar", "GlaudeQuit", "GlaudeClear", "GlaudeCancel",
            "GlaudeMode", "GlaudeModel", "GlaudeContinue", "GlaudeAttach",
            "GlaudeSave", "GlaudeYank", "GlaudeContext", "GlaudeAsk",
            "GlaudeGrep",
        },
        opts = {
            -- <C-CR> isn't reliably sent by every terminal; <C-s>
            -- works everywhere. Trade-off: terminals interpret <C-s>
            -- as XOFF (flow-control pause). nvim disables that on
            -- modern Windows/Win Terminal so this is fine.
            submit_key = "<C-s>",
            -- Terminal is BlexMono Nerd Font Mono, so swap in the
            -- icon glyph set in the sidebar attention column.
            glyphs = { nerd = true },
            -- Land in normal mode so motions/search/scrollback work
            -- before the first keystroke. Hit `i` to type.
            start_in_insert = false,
        },
    },
    {
        "andweeb/presence.nvim",
        config = function()
            require("presence").setup({
                auto_refresh = true,
            })
        end
    },
}
