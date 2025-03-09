-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps her
require("bhupen.discipline").cowboy()

--discipline.cowboy()
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

-- Navigate to definition
keymap.set("n", "gd", vim.lsp.buf.definition, opts)

-- Open file explorer (assuming you use nvim-tree or similar)
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Search files
keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Live grep in current working directory
keymap.set("n", "<C-f>", "<cmd>Telescope live_grep<cr>", opts)

-- Close current buffer
keymap.set("n", "<leader>q", "<cmd>Bdelete<CR>", opts)

-- List all open buffers
keymap.set("n", "<leader>bb", "<cmd>Telescope buffers<CR>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Barbar.nvim keybindings
-- Move to previous/next buffer
keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", opts)
keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", opts)

-- Re-order to previous/next buffer
keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", opts)
keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", opts)

-- Goto buffer in position...
for i = 1, 9 do
  keymap.set("n", "<A-" .. i .. ">", "<Cmd>BufferGoto " .. i .. "<CR>", opts)
end
keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", opts)

-- Pin/unpin buffer

keymap.set("n", "<A-j>", "<Cmd>BufferPin<CR>", opts)
-- Close buffer
keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", opts)
keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", opts)

-- Sort automatically by...
keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", opts)
keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", opts)
keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", opts)
keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", opts)
keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", opts)
-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

--java---

vim.api.nvim_set_keymap(
  "n",
  "<leader>r",
  ":w<CR>:TermExec cmd='javac % && java %:r' direction=vertical size=80<CR>",
  { noremap = true, silent = true }
)
-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
