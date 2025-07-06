return {
  "Saghen/blink.cmp",
  version = "*",
  event = "VeryLazy",
  opts_extend = { "sources.default" },
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      menu = {
        auto_show = false,
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
