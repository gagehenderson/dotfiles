return function()
    require("bufferline").setup {
        options = {
            themable        = true,
            tab_size        = 18, -- Horizontal padding.
            color_icons     = true,
            separator_style = "slant"
        }
    }
end
