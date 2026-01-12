-- This file contains the plugins fundamental for creating a useable neovim
-- experience, and that I intend to basically never mess with.
--
-- All plugin files are referenced in scripts.init-plugins.lua
return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            -- local configs = require("nvim-treesitter.configs")
            --
            -- configs.setup({
            --     ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html", "rust", "php", "typescript" },
            --     sync_install = false,
            --     highlight = { enable = true },
            --     indent = { enable = true }
            -- })
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        event = 'VimEnter',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        config = require("plugin-configs.telescope-config")
    },

    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },

    {
        -- Main LSP Configuration
        'neovim/nvim-lspconfig',
        dependencies = {
            { 'williamboman/mason.nvim', opts = {} },
            'williamboman/mason-lspconfig.nvim',
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            { 'j-hui/fidget.nvim', opts = {} },

            'hrsh7th/cmp-nvim-lsp',
        },
        config = require("plugin-configs.lsp-config")
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
              'L3MON4D3/LuaSnip',
              build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                  return
                end
                return 'make install_jsregexp'
              end)(),
            },
            'saadparwaiz1/cmp_luasnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lsp-signature-help',
          },
        config = require("plugin-configs.cmp-config")
    },
}
