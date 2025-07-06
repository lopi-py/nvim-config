return {
  "mason-org/mason.nvim",
  build = ":MasonUpdate",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  opts = {
    ensure_install = {
      "clangd",
      "css-lsp",
      "emmet-language-server",
      "eslint-lsp",
      "html-lsp",
      "intelephense",
      "jdtls",
      "json-lsp",
      "lemminx",
      "lua-language-server",
      "luacheck",
      "luau-lsp",
      "prettierd",
      "pyright",
      "ruff",
      "rust-analyzer",
      "selene",
      "stylua",
      "tailwindcss-language-server",
      "taplo",
      "vtsls",
      "yaml-language-server",
      "zls",
    },
  },
  init = function()
    local path_sep = vim.uv.os_uname().sysname == "Windows_NT" and ";" or ":"
    vim.env.MASON = vim.fn.stdpath "data" .. "/mason"
    vim.env.PATH = vim.env.MASON .. "/bin" .. path_sep .. vim.env.PATH
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
