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
        auto_show = false,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind" } },
        },
      },
    },
    sources = {
      default = { "lsp", "snippets", "buffer" },
    },
    cmdline = { enabled = false },
  },
}
