
-- Enable powershell.
local powershell_options = {
    shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
    shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
    shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
    shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
    shellquote = "",
    shellxquote = "",
}
for option, value in pairs(powershell_options) do
    vim.opt[option] = value
end

-- Enter insert mode when terminal opens, and leave it when it closes.
vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    command = "startinsert"
})
vim.api.nvim_create_autocmd("TermClose", {
    pattern = "*",
    command = "stopinsert"
})

-- :wqa without getting an error if terminal is open.
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "term://*",
    command = "stopinsert | q",
})
