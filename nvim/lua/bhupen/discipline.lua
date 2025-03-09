local M = {}

function M.cowboy()
  local counts = {} -- Store counts for each key

  for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
    local timer = vim.uv.new_timer()
    if not timer then
      vim.notify("Failed to create timer for key: " .. key, vim.log.levels.ERROR)
      return
    end
    vim.keymap.set("n", key, function()
      -- Initialize count for the key if not already set
      counts[key] = (counts[key] or 0) + 1

      -- Reset count after 2 seconds
      timer:start(2000, 0, function()
        counts[key] = 0
        timer:close() -- Close the timer to prevent resource leaks
      end)

      -- Notify the user if the key is pressed too many times
      if counts[key] >= 10 and vim.bo.buftype ~= "nofile" then
        vim.notify("Hold it Cowboy!", vim.log.levels.WARN, {
          icon = "🤠",
          id = "cowboy",
        })
      end

      return key -- Return the original key to execute its default behavior
    end, { expr = true, silent = true })
  end
end

return M
