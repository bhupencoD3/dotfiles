-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.mouse = "a"

vim.cmd([[let &t_Cs = "\e[4:3m"]])

vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.swapfile = false -- No swap files
vim.opt.undofile = true -- Keep undo history
vim.g.sessionoptions = "" -- No session saving

---vim.opt.guifont = "Iosevka Term:h14" -- Adjust size as needed
vim.g.mapleader = " " -- Set Leader key to space

---vim.opt.guicursor = "n-v-c:block-Cursor/lCursor-blinkon100"
vim.g.neovide_cursor_smooth_blink = true
-- Set a variant (latte, frappe, macchiato, or mocha)
--vim.g.catppuccin_flavour = "latte"

-- Enable transparent background
--vim.g.catppuccin_transparent_background = true

-- Enable italics for specific text
--vim.g.catppuccin_italic_keywords = true
--vim.g.catppuccin_italic_functions = true
