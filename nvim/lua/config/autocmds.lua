-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- Turn off paste mode when leaving here
--

-- Create a group for your autocommands
local group = vim.api.nvim_create_augroup("autosave_notify", { clear = true })

-- Flag to track if the notification has been triggered
local already_notified = false

-- Auto-save notification on save
vim.api.nvim_create_autocmd("User", {
  pattern = "AutoSaveWritePost",
  group = group,
  callback = function()
    if not already_notified then
      -- Trigger the notification when the file is saved
      require("notify")("AutoSaved at " .. vim.fn.strftime("%H:%M:%S"), "info", { title = "Auto-Save" })
      already_notified = true
    end
  end,
})

-- Reset the flag when a manual save occurs (BufWritePre)
vim.api.nvim_create_autocmd("BufWritePre", {
  group = group,
  callback = function()
    already_notified = false -- Reset the flag to allow notifications for the next auto-save event
  end,
})

-- Show a notification when the window loses focus
--vim.api.nvim_create_autocmd("FocusLost", {
-- group = group,
--callback = function()
--    require("notify")("🌚 Focus lost", "info")
--  end,
--})

-- Show a notification for errors (e.g., LSP diagnostics)
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "LspDiagnosticsChanged",
  callback = function()
    require("notify")("🖕 Something went wrong!", "error")
  end,
})

-- Show a notification when leaving insert mode
--vim.api.nvim_create_autocmd("InsertLeave", {
-- - group = group,
--  callback = function()
---    require("notify")("🥱 Insert mode left", "info")
--  end,
---})

-- Show a notification for buffer change
--vim.api.nvim_create_autocmd("BufWinEnter", {
--  group = group,
--- callback = function()
-- require("notify")("🤔 Buffer changed", "info")
--  end,
--})

-- Show a notification for warnings (e.g., LSP warning)
vim.api.nvim_create_autocmd("User", {
  group = group,
  pattern = "LspWarning",
  callback = function()
    require("notify")("⚠️ This is a warning", "warn")
  end,
})

-- Show a notification for window change
--vim.api.nvim_create_autocmd("WinLeave", {
--  group = group,
--  callback = function()
--    require("notify")("🤓 Window changed", "info")
--  end,
--})

-- Show a notification for text change
--vim.api.nvim_create_autocmd("TextChanged", {
--  group = group,
-- callback = function()
--    require("notify")("✍️ Text changed", "info")
--  end,
--})

-- Disable paste mode after leaving insert mode
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("set nopaste") -- Disable paste mode
  end,
})

-- Disable the concealing in certain file types (json, jsonc, markdown)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.opt.conceallevel = 0
  end,
})
