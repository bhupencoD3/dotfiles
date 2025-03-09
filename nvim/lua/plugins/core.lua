return {
  -- Treesitter for syntax highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- LSP (Language Server Protocol)
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- File Explorer (NvimTree)
  ---  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- Telescope (Fuzzy Finder)
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- Git integration
  --{ "tpope/vim-fugitive" },
  ---{ "lewis6991/gitsigns.nvim", config = true },

  -- Statusline (Lualine)
  { "nvim-lualine/lualine.nvim" },

  -- Colorschemes
  { "folke/tokyonight.nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
}
