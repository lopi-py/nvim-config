-- TODO: better documentation window integration with 'winborder = solid'

return {
  "Saghen/blink.cmp",
  version = "*",
  event = "VeryLazy",
  opts = {
    completion = {
      accept = {
        auto_brackets = { enabled = false },
      },
      menu = {
        min_width = 1,
        border = "none",
        auto_show = false,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind" } },
        },
      },
      documentation = {
        window = { border = "padded" },
      },
    },
    sources = {
      default = { "lsp", "snippets", "buffer" },
    },
    cmdline = { enabled = false },
  },
}
