return {
  "okuuva/auto-save.nvim",
  opts = {
    enabled = true,
    trigger_events = {
      immediate_save = { "BufLeave", "FocusLost", "WinLeave" },
      defer_save = { "InsertLeave", "TextChanged", "CursorHoldI" },
      cancel_deferred_save = { "InsertEnter" },
    },
    debounce_delay = 1500, -- Reduce frequent saves
    condition = function(buf)
      local buftype = vim.bo[buf].buftype
      local filetype = vim.bo[buf].filetype
      local filename = vim.api.nvim_buf_get_name(buf)

      -- Prevent saving special buffers
      if buftype ~= "" and buftype ~= "acwrite" then
        return false
      end

      -- Skip specific file types
      if filetype == "harpoon" or filetype == "mysql" or filetype == "terminal" then
        return false
      end

      -- Prevent saving unmodifiable or unnamed files
      if not vim.bo[buf].modifiable or filename == "" then
        return false
      end

      return true
    end,
    noautocmd = false,
    lockmarks = false,

    -- Auto-save notification (prevent spam)
    callbacks = {
      after_saving = function()
        pcall(function()
          require("notify")("AutoSaved!", "info", {
            title = "Auto-Save",
            timeout = 1000, -- Auto-hide after 1s
            hide_from_history = true, -- Avoid cluttering history
          })
        end)
      end,
    },
  },
}
