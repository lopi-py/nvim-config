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
    },
    windows = {
      ghost_text = {
        enabled = true,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
  },
}
