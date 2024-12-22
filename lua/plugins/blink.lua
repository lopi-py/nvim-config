return {
  "lopi-py/blink.cmp",
  event = "InsertEnter",
  opts_extend = { "sources.default" },
  opts = {
    completion = {
      accept = {
        auto_brackets = {
          enabled = true,
        },
      },
      menu = {
        min_width = 1,
        draw = {
          columns = { { "label", "label_description", gap = 1 }, { "kind" } },
        },
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = {},
    },
  },
}
