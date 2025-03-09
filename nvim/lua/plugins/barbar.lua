return {
  "romgrk/barbar.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- Icons support
  },
  config = function()
    require("barbar").setup({
      animation = true, -- Smooth animations
      auto_hide = false, -- Keep the tabline visible
      tabpages = true, -- Show tab numbers
      clickable = true, -- Make tabs clickable
      exclude_ft = { "NvimTree", "neo-tree", "dashboard" }, -- Hide file explorers
      exclude_name = { "NvimTree", "neo-tree", "dashboard" }, -- Hide specific buffer names
      icons = {
        buffer_index = true, -- Show buffer numbers
        filetype = { enabled = true },
        modified = { button = "●" },
        pinned = { button = "📌" },
        separator = { left = "▎", right = "" }, -- Better styling
      },
      -- Additional options merged from the second configuration
      options = {
        mode = "tabs", -- Show buffer/tabs in the tabline
        numbers = "none", -- Buffer numbering mode
        close_command = "bdelete! %d", -- Customize how to close buffers
        right_mouse_command = "bdelete! %d", -- Right-click behavior
        left_mouse_command = "buffer %d", -- Left-click behavior
        middle_mouse_command = nil, -- Middle-click behavior
        indicator = {
          icon = "▎", -- Indicator for the current tab
          style = "icon",
        },
        buffer_close_icon = "", -- Icon for closing a buffer
        modified_icon = "●", -- Icon for modified buffers
        close_icon = "", -- Icon for closing a tab
        left_trunc_marker = "", -- Marker for truncated tabs on the left
        right_trunc_marker = "", -- Marker for truncated tabs on the right
        max_name_length = 18, -- Maximum length of buffer names
        max_prefix_length = 15, -- Maximum length of prefixes
        tab_size = 18, -- Size of each tab
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in the tabline
        diagnostics_update_in_insert = false, -- Update diagnostics during insert mode
        offsets = {
          {
            filetype = "neo-tree", -- Ensure it doesn't overlap with neo-tree
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
          {
            filetype = "NvimTree", -- Ensure it doesn't overlap with NvimTree
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
        show_buffer_icons = true, -- Show icons for buffers
        show_buffer_close_icons = true, -- Show close icons for buffers
        show_close_icon = true, -- Show close icon for the tabline
        show_tab_indicators = true, -- Show indicators for the current tab
        persist_buffer_sort = true, -- Persist buffer sorting
        separator_style = "thin", -- Separator style: "slant" | "thick" | "thin"
        enforce_regular_tabs = false, -- Enforce regular tab size
        always_show_bufferline = true, -- Always show the bufferline
        sort_by = "insert_after_current", -- Sort buffers by insertion order
      },
    })

    -- Auto-hide bufferline when only one buffer exists
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        local buffer_count = #vim.fn.getbufinfo({ buflisted = 1 })
        vim.o.showtabline = (buffer_count > 1) and 2 or 0
      end,
    })
  end,
}
