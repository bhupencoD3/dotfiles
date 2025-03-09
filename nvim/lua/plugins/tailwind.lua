return {
  -- Tailwind LSP support
  { "neovim/nvim-lspconfig", opts = { servers = { tailwindcss = {} } } },

  -- Tailwind colors inside completion menu
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    config = function()
      require("tailwindcss-colorizer-cmp").setup()
    end,
  },

  -- General color highlighting (including Tailwind colors)
  { "NvChad/nvim-colorizer.lua", config = true },
}
