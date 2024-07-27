return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {
    ensure_install = {
      "clangd",
      "css-lsp",
      "debugpy",
      "eslint-lsp",
      "html-lsp",
      "java-debug-adapter",
      "java-test",
      "jdtls",
      "json-lsp",
      "lua-language-server",
      "luacheck",
      "luau-lsp",
      "prettierd",
      "pyright",
      "ruff",
      "rust-analyzer",
      "selene",
      "stylua",
      "vtsls",
      "yaml-language-server",
    },
  },
  init = function()
    local path_sep = vim.uv.os_uname().sysname == "Windows_NT" and ";" or ":"
    local bin_path = vim.fn.stdpath "data" .. "/mason/bin"

    vim.env.PATH = bin_path .. path_sep .. vim.env.PATH
  end,
  config = function(_, opts)
    require("mason").setup {
      PATH = "skip",
    }
    require("mason-tool-installer").setup {
      ensure_installed = opts.ensure_install,
    }
  end,
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
}
