return {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "grn",
      function()
        return ":IncRename " .. vim.fn.expand "<cword>"
      end,
      expr = true,
    },
  },
  opts = {
    save_in_cmdline_history = false,
  },
}
