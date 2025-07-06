return {
  {
    "Jari27/lazydev.nvim",
    branch = "deprecate_client_notify",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },

  {
    "Saghen/blink.cmp",
    opts = {
      sources = {
        default = { "lazydev" },
        providers = {
          lazydev = {
            module = "lazydev.integrations.blink",
            fallbacks = { "lsp" },
          },
        },
      },
    },
  },
}
