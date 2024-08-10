return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      luau = { "stylua" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      python = { "black" },
    },
    formatters = {},
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = function()
      if not vim.g.autoformat then
        return
      end
      return { timeout_ms = 500 }
    end,
    notify_on_error = false,
  },
  init = function()
    vim.g.autoformat = true
    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
  end,
}
