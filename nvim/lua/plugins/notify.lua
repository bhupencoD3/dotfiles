return {
  "rcarriga/nvim-notify",
  config = function()
    local notify = require("notify")

    -- Configure notify plugin
    notify.setup({
      stages = "fade", -- Animation style
      timeout = 3000, -- Notification duration
      ----background_colour = "", -- Dark purple background
      merge_duplicates = true, -- max_widtherge duplicate messages
      render = "minimal", -- Notification style
      max_width = 80, -- Max width of notification
      fps = 60, -- Animation speed
      icons = {
        ERROR = "🖕", -- Error icon
        WARN = "⚠️", -- Warning icon
        INFO = "🌚", -- Info icon (e.g. focus lost)
        DEBUG = "🪲", -- Debug icon
        TRACE = "✍️", -- Trace icon
      },
    })

    -- Custom highlight groups for notification levels
    vim.cmd([[
      highlight NotifyINFO guifg=#FFFFFF guibg=#3B0D45
      highlight NotifyWARN guifg=#D0ECE7 guibg=#3B0D45
      highlight NotifyERROR guifg=#660066 guibg=#3B0D45
      highlight NotifyDEBUG guifg=#00FF00 guibg=#3B0D45
      highlight NotifyTRACE guifg=#EBF5FB guibg=#3B0D45
    ]])
  end,
}
