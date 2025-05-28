return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  config = function()
    require "config.lsp"

    vim.lsp.config("clangd", {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=detailed",
      },
    })

    vim.lsp.config("emmet_language_server", {
      filetypes = {
        "blade",
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "php",
        "pug",
        "sass",
        "scss",
        "typescriptreact",
      },
    })

    vim.lsp.config("jsonls", {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas {
            extra = {
              {
                name = "default.project.json",
                description = "JSON schema for Rojo project files",
                fileMatch = { "*.project.json" },
                url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
              },
            },
          },
          validate = {
            enable = true,
          },
        },
      },
    })

    vim.lsp.config("luau-lsp", {
      settings = {
        ["luau-lsp"] = {
          ignoreGlobs = { "**/_Index/**", "**/.pesde/**", "node_modules/**" },
          completion = {
            imports = {
              enabled = true,
              ignoreGlobs = { "**/_Index/**", "**/.pesde/**", "node_modules/**" },
            },
            addParentheses = false,
            fillCallArguments = false,
          },
          inlayHints = {
            functionReturnTypes = true,
            parameterTypes = true,
          },
        },
      },
    })

    vim.lsp.config("rust_analyzer", {
      settings = {
        ["rust-analyzer"] = {
          check = {
            command = "clippy",
            extraArgs = { "--no-deps" },
          },
        },
      },
    })

    vim.lsp.config("vtsls", {
      settings = {
        typescript = {
          updateImportsOnFileMove = "always",
        },
        javascript = {
          updateImportsOnFileMove = "always",
        },
        vtsls = {
          enableMoveToFileCodeAction = true,
        },
      },
    })

    vim.lsp.enable {
      "clangd",
      "cssls",
      "emmet_language_server",
      "eslint",
      "html",
      "intelephense",
      "jsonls",
      "lemminx",
      "lua_ls",
      "pyright",
      "ruff",
      "rust_analyzer",
      "tailwindcss",
      "taplo",
      "vtsls",
      "yamlls",
    }
  end,
  dependencies = {
    "b0o/SchemaStore.nvim",
  },
}
