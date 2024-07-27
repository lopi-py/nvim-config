return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  keys = {
    {
      "=",
      function()
        require("conform").format { async = true }
      end,
    },
  },
  opts = {
    default_format_opts = { lsp_format = "fallback" },
    formatters_by_ft = {
      lua = { "stylua" },
      luau = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
    },
    formatters = {},
    format_on_save = function()
      if vim.g.disable_autoformat then
        return
      end
      return { timeout_ms = 500 }
    end,
    notify_on_error = false,
  },
  init = function()
    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
  end,
}
