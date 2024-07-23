return {
  "kosayoda/nvim-lightbulb",
  event = { "LspAttach" },
  opts = {
    sign = {
      enabled = false,
    },
    virtual_text = {
      enabled = true,
      hl = "CursorLine",
    },
    autocmd = {
      enabled = true,
      updatetime = vim.o.updatetime,
    },
  },
}
