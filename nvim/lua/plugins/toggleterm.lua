local M = {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
}

function M.config()
  local function create_terminal(cmd, count)
    return require("toggleterm.terminal").Terminal:new({
      cmd = cmd,
      count = count,
      direction = "float",
      float_opts = { border = "rounded" },
      on_open = function(term)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
      end,
      on_close = function()
        vim.cmd("startinsert!")
      end,
    })
  end

  local terminals = {
    lazygit = create_terminal("lazygit", 101),
    bun_outdated = create_terminal("bunx npm-check-updates@latest -ui --format group --packageManager bun", 102),
    cargo_run = create_terminal("cargo run -q", 103),
  }

  for key, term in pairs(terminals) do
    vim.keymap.set("n", "<leader>" .. key, function()
      term:toggle()
    end, { noremap = true, silent = true })
  end

  local function get_buf_size()
    local cbuf = vim.api.nvim_get_current_buf()
    local bufinfo = vim.tbl_filter(function(buf)
      return buf.bufnr == cbuf
    end, vim.fn.getwininfo(vim.api.nvim_get_current_win()))[1]
    if bufinfo == nil then
      return { width = -1, height = -1 }
    end
    return { width = bufinfo.width, height = bufinfo.height }
  end

  local function get_dynamic_terminal_size(direction, size)
    if direction ~= "float" and tostring(size):find(".", 1, true) then
      size = math.min(size, 1.0)
      local buf_sizes = get_buf_size()
      local buf_size = direction == "horizontal" and buf_sizes.height or buf_sizes.width
      return buf_size * size
    else
      return size
    end
  end

  local execs = {
    { nil, "<M-1>", "Horizontal Terminal", "horizontal", 0.3 },
    { nil, "<M-2>", "Vertical Terminal", "vertical", 0.4 },
    { nil, "<M-3>", "Float Terminal", "float", nil },
  }

  local function add_exec(opts)
    local binary = opts.cmd:match("(%S+)")
    if vim.fn.executable(binary) ~= 1 then
      vim.notify("Skipping configuring executable " .. binary .. ". Please make sure it is installed properly.")
      return
    end

    vim.keymap.set({ "n", "t" }, opts.keymap, function()
      local Terminal = require("toggleterm.terminal").Terminal
      local term = Terminal:new({ cmd = opts.cmd, count = opts.count, direction = opts.direction })
      term:toggle(opts.size(), opts.direction)
    end, { desc = opts.label, noremap = true, silent = true })
  end

  for i, exec in pairs(execs) do
    local direction = exec[4]
    local opts = {
      cmd = exec[1] or vim.o.shell,
      keymap = exec[2],
      label = exec[3],
      count = i + 100,
      direction = direction,
      size = function()
        return get_dynamic_terminal_size(direction, exec[5])
      end,
    }
    add_exec(opts)
  end

  require("toggleterm").setup({
    size = 80,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = false,
    direction = "float",
    close_on_exit = true,
    shell = nil,
    float_opts = {
      border = "rounded",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
    winbar = {
      enabled = true,
      name_formatter = function(term)
        return term.count
      end,
    },
  })

  vim.api.nvim_create_augroup("TerminalSetup", { clear = true })
  vim.api.nvim_create_autocmd("TermOpen", {
    group = "TerminalSetup",
    pattern = "*",
    callback = function()
      vim.api.nvim_feedkeys("i", "n", false)
    end,
  })
  vim.api.nvim_create_autocmd("TermEnter", {
    group = "TerminalSetup",
    pattern = "*",
    callback = function()
      vim.cmd("startinsert")
      _G.set_terminal_keymaps()
    end,
  })

  function _G.set_terminal_keymaps()
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<m-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
    vim.keymap.set("n", "<leader>gz", function()
      terminals.lazygit:toggle()
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gb", function()
      terminals.bun_outdated:toggle()
    end, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gc", function()
      terminals.cargo_run:toggle()
    end, { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, "t", "<m-l>", [[<C-\><C-n><C-W>l]], opts)
  end
  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
end

return M
