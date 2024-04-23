local util = require "util"

return {
  {
    "wookayin/semshi",
    ft = { "python" },
    build = ":UpdateRemotePlugins",
    init = function()
      vim.g.python3_host_prog = vim.fn.exepath "python3"

      vim.g["semshi#error_sign"] = false
      vim.g["semshi#simplify_markup"] = false
      vim.g["semshi#mark_selected_nodes"] = false
      vim.g["semshi#update_delay_factor"] = 0.001
      vim.g["semshi#excluded_hl_groups"] = { "unresolved" }

      local function update_highlights()
        vim.api.nvim_set_hl(0, "semshiGlobal", { italic = true })
        vim.api.nvim_set_hl(0, "semshiImported", { link = "@lsp.type.namespace" })
        vim.api.nvim_set_hl(0, "semshiLocal", { link = "@variable" })
        vim.api.nvim_set_hl(0, "semshiParameter", { link = "@lsp.type.parameter" })
        vim.api.nvim_set_hl(0, "semshiParameterUnused", { link = "DiagnosticUnnecessary" })
        vim.api.nvim_set_hl(0, "semshiBuiltin", { link = "@function.builtin" })
        vim.api.nvim_set_hl(0, "semshiAttribute", { link = "@field" })
        vim.api.nvim_set_hl(0, "semshiSelf", { link = "@lsp.type.selfKeyword" })
        vim.api.nvim_set_hl(0, "semshiFree", { link = "@comment" })
      end

      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = update_highlights,
      })

      update_highlights()
    end,
  },

  {
    "linux-cultist/venv-selector.nvim",
    ft = { "python" },
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
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    config = function()
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      require("dap-python").setup(util.path_join(path, "venv", "bin", "python"))
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
    },
  },
}
