return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      lua = { "stylua" },
      luau = { "stylua" },
      python = { "ruff_organize_imports", "ruff_format" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
    },
    format_on_save = function()
      if vim.g.autoformat then
        return {
          timeout_ms = 500,
          lsp_format = "fallback",
        }
      end
    end,
  },
  init = function()
    vim.g.autoformat = true
  end,
}
