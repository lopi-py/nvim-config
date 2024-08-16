return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = {
    ensure_install = {
      -- servers
      "basedpyright",
      "clangd",
      "css-lsp",
      "eslint-lsp",
      "html-lsp",
      "jdtls",
      "json-lsp",
      "lua-language-server",
      "luau-lsp",
      "ruff",
      "rust-analyzer",
      "taplo",
      "vtsls",
      "yaml-language-server",
      -- formatters
      "black",
      "prettierd",
      "stylua",
      -- linters
      "luacheck",
      "selene",
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

    vim.api.nvim_create_user_command("MasonInstallAll", function()
      require("mason.ui").open()
      require("mason-registry").refresh(function()
        for _, tool in ipairs(opts.ensure_install) do
          local pkg = require("mason-registry").get_package(tool)
          if not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end, {})
  end,
}
