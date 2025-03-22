return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    servers = {
      clangd = {
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--completion-style=detailed",
        },
      },
      cssls = {},
      emmet_language_server = {
        filetypes = {
          "blade",
          "css",
          "html",
          "javascriptreact",
          "php",
          "typescriptreact",
        },
      },
      eslint = {},
      html = {},
      intelephense = {},
      jsonls = function()
        return {
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
        }
      end,
      lemminx = {},
      lua_ls = {},
      pyright = {},
      ruff = {
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
          },
        },
      },
      tailwindcss = {},
      taplo = {},
      vtsls = {
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
      },
      yamlls = {},
    },
  },
  config = function(_, opts)
    local capabilities = require("lsp").capabilities()
    for server, config in pairs(opts.servers) do
      config = type(config) == "function" and config() or config
      config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
      require("lspconfig")[server].setup(config)
    end
  end,
  dependencies = {
    "b0o/SchemaStore.nvim",
  },
}
