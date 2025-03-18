return {
  "Saghen/blink.cmp",
  version = "*",
  event = "VeryLazy",
  opts_extend = { "sources.default" },
  opts = {
    completion = {
      menu = {
        min_width = 1,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind" } },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    cmdline = {
      enabled = false,
    },
  },
}
