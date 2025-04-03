function vim.g.run_project()
    local is_windows = vim.fn.has('win32') == 1
    local is_unix = vim.fn.has('unix') == 1

    if vim.fn.filereadable('package.json') == 1 then
        vim.cmd('!npm run start')
    elseif is_windows and vim.fn.filereadable('run.bat') == 1 then
        vim.cmd('!run.bat')
    elseif is_unix and vim.fn.filereadable('run.sh') == 1 then
        vim.cmd('!./run.sh')
    else
        vim.cmd('echo "Could not determine project type."')
    end
end

vim.keymap.set("", "<F6>", vim.g.run_project, { noremap = true, silent = true })

