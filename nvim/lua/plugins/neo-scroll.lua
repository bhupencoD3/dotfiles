return {
  "karb94/neoscroll.nvim",
  event = "VeryLazy",
  config = function()
    require("neoscroll").setup({
      easing_function = "quadratic", -- Smooth easing
      hide_cursor = false, -- Keep cursor visible
      stop_eof = false, -- Continue scrolling past EOF
      respect_scrolloff = true, -- Stop scrolling when reaching scrolloff
    })

    local mappings = {
      ["j"] = { 1, true, 100 }, -- Smoothly move down
      ["k"] = { -1, true, 100 }, -- Smoothly move up
      ["h"] = { -2, true, 100 }, -- Smoothly move left
      ["l"] = { 2, true, 100 }, -- Smoothly move right
      ["<C-d>"] = { vim.wo.scroll, true, 250 }, -- Page down
      ["<C-u>"] = { -vim.wo.scroll, true, 250 }, -- Page up
      ["<A-f>"] = { vim.api.nvim_win_get_height(0), true, 450 }, -- Full page down
      ["<A-b>"] = { -vim.api.nvim_win_get_height(0), true, 450 }, -- Full page up
    }

    for key, value in pairs(mappings) do
      vim.keymap.set({ "n", "v" }, key, function()
        require("neoscroll").scroll(unpack(value))
      end, { silent = true, noremap = true })
    end
  end,
}
