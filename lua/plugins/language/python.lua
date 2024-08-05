return {
  {
    "linux-cultist/venv-selector.nvim",
    cmd = { "VenvSelect" },
    opts = {
      dap_enabled = true,
    },
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
        "mfussenegger/nvim-dap-python",
        config = function()
          local registry = require "mason-registry"
          local debugpy_path = registry.get_package("debugpy"):get_install_path()

          require("dap-python").setup(debugpy_path .. "/venv/bin/python")
        end,
        dependencies = {
          "williamboman/mason.nvim",
          "mfussenegger/nvim-dap",
        },
      },
    },
  },
}
