--return {
--"craftzdog/solarized-osaka.nvim",
--lazy = true,
--priority = 1000,
--opts = function()
-- return {
--  transparent = true,
-- }
--end,
--},

--"shaunsingh/nord.nvim",
--config = function()
-- vim.cmd("colorscheme nord")
--end,
--},

-- ~/.config/nvim/lua/plugins/colorscheme.lua
--"catppuccin/nvim", -- Catppuccin theme
--config = function()
--  vim.cmd("colorscheme catppuccin") -- Set the colorscheme to catppuccin
--  end,
--  },

-- {

-- "rebelot/kanagawa.nvim",
--config = function()
-- Set the colorscheme after the plugin is loaded
--vim.cmd("colorscheme kanagawa")
--end,
--},
--}

--return {
-- colorscheme = "carbonfox",
--}
--
return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_foreground = "material"
    vim.g.gruvbox_material_disable_italic_comment = 1
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
