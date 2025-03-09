return {
  {
    "mfussenegger/nvim-jdtls", -- Java LSP
    ft = { "java" },
    config = function()
      local home = os.getenv("HOME")
      local jdtls = require("jdtls")
      local root_dir = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h")
      local workspace_dir = home .. "/.cache/jdtls/workspace/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

      local config = {
        cmd = { "jdtls", "-data", workspace_dir },
        root_dir = root_dir,
      }

      jdtls.start_or_attach(config)
    end,
  },
}
