-- I am currently using a simple task file and some daily journals
-- to keep track of my tasks and progress.
-- This file automates creating and accessing those.

-- Base folders
local NOTES_BASE   = "C:/Users/gagep/Dropbox/Notes"
local JOURNAL_BASE = NOTES_BASE .. "/Journal"
local TASKS_FILE   = NOTES_BASE .. "/tasks.md"

-- Toggle: also open tasks on start?
local OPEN_ON_START = true

-- Join paths with forward slashes
local function join(...) return table.concat({...}, "/") end

-- Ensure directory exists (like `mkdir -p`)
local function ensure_dir(dir)
    if vim.fn.isdirectory(dir) == 0 then
        vim.fn.mkdir(dir, "p")
    end
end

-- Create (if missing) and open a daily note for a given os.time() value
local function open_daily_note(t)
    t = t or os.time()
    local y  = os.date("%Y", t)
    local m  = os.date("%m", t)
    local ds = os.date("%Y-%m-%d", t)

    local dir  = join(JOURNAL_BASE, y, m)
    ensure_dir(dir)

    local file = join(dir, ds .. ".md")

    if vim.fn.filereadable(file) == 0 then
        local header = {
            "# " .. ds,
            "## Todo",
            "- ",
            "",
            "## Scratch",
            "- ",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "---",
        }
        vim.fn.writefile(header, file)
    end

    vim.cmd.edit(vim.fn.fnameescape(file))

    -- If Harpoon is installed, optionally add to list (works with v2 API)
    local harpoon = require("harpoon")
    if harpoon and harpoon.list then
        harpoon:list():add() -- YOLO
    end
end

local function open_tasks()
    vim.cmd.edit(vim.fn.fnameescape(TASKS_FILE))
end

-- User commands
vim.api.nvim_create_user_command("DailyNote", function() open_daily_note() end, {})

-- Quick mapping: <leader>jn to jump to today’s note, <leader>jt to jump to tasks
vim.keymap.set("n", "<leader>jn", function() open_daily_note() end, { desc = "Open today's journal note" })
vim.keymap.set("n", "<leader>jt", function() open_tasks() end, { desc = "Open tasks.md" })

-- Optional: command to jump to your tasks file
vim.api.nvim_create_user_command("Tasks", function() open_tasks() end, {})

-- Auto-create/open today’s note when you start Neovim
if OPEN_ON_START then
    vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
            -- Only trigger when starting without a file argument (typical “open nvim in ~” flow)
            if vim.fn.argc() == 0 then
                open_tasks()
            end
        end,
    })
end

