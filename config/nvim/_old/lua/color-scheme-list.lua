return {
    'olimorris/onedarkpro.nvim',
    'gmr458/vscode_modern_theme.nvim',
    'sainnhe/sonokai',
    "Oniup/ignite.nvim",
    'crispybaccoon/evergarden',
    'rose-pine/neovim',
    'HoNamDuong/hybrid.nvim',
    'stankovictab/mgz.nvim',
    'ab-dx/ares.nvim',
    'iagorrr/noctis-high-contrast.nvim',

    {
      'sainnhe/gruvbox-material',
      lazy = false,
      priority = 1000,
      config = function()
        -- Optionally configure and load the colorscheme
        -- directly inside the plugin declaration.
        vim.g.gruvbox_material_enable_italic = true
        vim.g.gruvbox_material_background = 'hard'
        vim.cmd.colorscheme('gruvbox-material')
      end
    },

    {
        "presindent/ethereal.nvim",
        opts = {
            -- Options for customization go here.
        },
        config = function(_, opts)
            vim.cmd [[colorscheme ethereal]]
        end,
    },

    {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme tokyodark]]
        end,
    },
    {
        "luisiacc/the-matrix.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.thematrix_telescope_theme = 1
        end
    }
}
