-- A custom little file to compile the plugins for, and setup lazy.

-- Setup lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local all_plugins = {}

local lists = {
    require("plugin-lists.core-plugins"),
    require("plugin-lists.extra-plugins"),
    require("plugin-lists.theme-plugins"),
}

for _, list in ipairs(lists) do
    for _, plugin in ipairs(list) do
        table.insert(all_plugins, plugin)
    end
end

require("lazy").setup(all_plugins)

