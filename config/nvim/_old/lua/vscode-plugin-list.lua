return {
    {
            "folke/zen-mode.nvim",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
    },
    { "numToStr/Comment.nvim", opts = {} },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    { "godlygeek/tabular" },
    "LudoPinelli/comment-box.nvim",
    "ggandor/leap.nvim",
}
