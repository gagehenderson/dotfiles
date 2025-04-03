return function()
    require("notify").setup({
        fps = 144,
        background_color = "#1e222a",
    })

    -- Create a "CloseNotifications" command that runs
    -- notify.dismiss()
    vim.cmd("command! CloseNotifications lua require('notify').dismiss()")
end
