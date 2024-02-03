local function get_format_opts(bufnr)
  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
    return
  end
  return { timeout_ms = 500, lsp_fallback = true }
end

return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "Format", "FormatEnable", "FormatDisable", "ConformInfo" },
    opts = {
      formatters_by_ft = {},
      formatters = {},
      format_after_save = get_format_opts,
    },
    init = function()
      vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
    end,
    config = function(_, opts)
      require("conform").setup(opts)

      vim.api.nvim_create_user_command("Format", function()
        require("conform").format { timeout_ms = 500, lsp_fallback = true }
      end, {})

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {})

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, { bang = true })
    end,
  },
}
