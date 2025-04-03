-- Called when we are in an instance of neovim in the vscode neovim extension.

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

---
---Consolidate all actual plugins.
---(I've seperated non-theme plugins from themes).
require("lazy").setup(require("vscode-plugin-list"))

