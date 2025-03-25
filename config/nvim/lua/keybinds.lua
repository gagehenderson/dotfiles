local opts = { noremap = true, silent = true }

-- Basic vim stuff.
opts.desc = "Netrw"
vim.keymap.set("n", "<leader>b", ":Explore<CR>", opts)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
vim.keymap.set("n", "<C-c>", ":Telescope colorscheme<CR>", opts)

-- Terminal
vim.keymap.set({"n","v","i", "t"}, "<C-t>", function()
  vim.cmd("ToggleTerm")
end, { noremap = true, silent = true })
function _G.set_terminal_keymaps()
    local t_opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], t_opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Tabularize.
vim.keymap.set("v", "<leader>a", ":Tabularize /=<CR>", opts)

-- Little function that attempts to run the project in our directory.
function vim.g.run_project()
    local is_windows = vim.fn.has('win32') == 1
    local is_unix = vim.fn.has('unix') == 1

    if is_windows and vim.fn.filereadable('run.bat') == 1 then
        vim.cmd('!./run.bat')
    elseif is_unix and vim.fn.filereadable('run.sh') == 1 then
        vim.cmd('!./run.sh')
    else
        vim.cmd('echo "Could not determine project type."')
    end
end

vim.keymap.set("", "<F6>", vim.g.run_project, opts)

-- Harpoon
local harpoon = require("harpoon")
opts.desc = "Harpoon Append: Append a new entry to the list of buffers"
vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, opts)
opts.desc = "Harpoon Prepend: Prepend a new entry to the list of buffers"
vim.keymap.set("n", "<leader>hp", function() harpoon:list():prepend() end, opts)

opts.desc = "Harpoon Show: View entire list of buffers"
vim.keymap.set("n", "<leader>hs", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, opts)

opts.desc = "Harpoon First: Go to 1st entry in list of buffers"
vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, opts)
opts.desc = "Harpoon Second: Go to 2nd entry in list of buffers"
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, opts)
opts.desc = "Harpoon Third: Go to 3rd entry in list of buffers"
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, opts)
opts.desc = "Harpoon Fourth: Go to 4th entry in list of buffers"
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, opts)
opts.desc = "Harpoon Fifth: Go to 5th entry in list of buffers"
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, opts)
opts.desc = "Harpoon Sixth: Go to 6th entry in list of buffers"
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, opts)
opts.desc = "Harpoon Seventh: Go to 7th entry in list of buffers"
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, opts)
opts.desc = "Harpoon Eighth: Go to 8th entry in list of buffers"
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, opts)
opts.desc = "Harpoon Ninth: Go to 9th entry in list of buffers"
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, opts)

-- Snacks
local Snacks = require("snacks")
-- opts.desc = "File Explorer"
-- vim.keymap.set("n", "<leader>b", function() Snacks.explorer() end, opts)
opts.desc = "Zen mode"
vim.keymap.set("n", "<leader>z", function() Snacks.zen() end, opts)

-- Comment box (LudoPinelli/comment-box.nvim)
vim.keymap.set({ "n", "v"}, "<Leader>cb", "<Cmd>CBllbox<CR>", opts)
vim.keymap.set({ "n", "v"}, "<Leader>cbd", "<Cmd>CBd<CR>", opts) -- Delete comment box.
vim.keymap.set({ "n", "v"}, "<Leader>cl", "<Cmd>CBline<CR>", opts)
vim.keymap.set({ "n", "v"}, "<Leader>clt", "<Cmd>CBccline<CR>", opts)
