-- A custom little file to compile the plugins for, and setup lazy.

---Setup lazy.
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

local allPlugins = {}
local normalPlugins = require("plugin-list")
local colorSchemePlugins = require("color-scheme-list")
for _, plugin in ipairs(normalPlugins) do
    table.insert(allPlugins, plugin)
end
for _, plugin in ipairs(colorSchemePlugins) do
    table.insert(allPlugins, plugin)
end

---
---Consolidate all actual plugins.
---(I've seperated non-theme plugins from themes).
require("lazy").setup(allPlugins)

