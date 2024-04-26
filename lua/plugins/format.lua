return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    keys = {
      {
        "<leader>tf",
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
        end,
      },
      {
        "=",
        function()
          require("conform").format { async = true, lsp_fallback = true }
        end,
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        luau = { "stylua" },
        typescript = { "prettierd" },
        typescriptreact = { "prettierd" },
        javascript = { "prettierd" },
        javascriptreact = { "prettierd" },
        html = { "prettierd" },
      },
      formatters = {},
      format_on_save = function()
        if vim.g.disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,
      notify_on_error = false,
    },
    init = function()
      vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
    end,
  },
}
