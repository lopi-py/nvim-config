local function get_json_schemas()
  local schemas = require("schemastore").json.schemas()

  table.insert(schemas, {
    fileMatch = { "*.project.json", "*.project.jsonc" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  })

  return schemas
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "LazyFile" },
    config = function()
      local lspconfig = require "lspconfig"
      local capabilities = require("lsp").capabilities

      lspconfig.clangd.setup {
        capabilities = capabilities {
          offsetEncoding = { "utf-16" },
        },
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        },
      }

      lspconfig.cssls.setup {
        capabilities = capabilities(),
      }

      lspconfig.eslint.setup {
        capabilities = capabilities(),
      }

      lspconfig.html.setup {
        capabilities = capabilities(),
      }

      lspconfig.jsonls.setup {
        capabilities = capabilities(),
        settings = {
          json = {
            schemas = get_json_schemas(),
          },
        },
      }

      lspconfig.pyright.setup {
        capabilities = capabilities(),
      }

      lspconfig.ruff_lsp.setup {
        capabilities = capabilities(),
        on_attach = function(client)
          client.server_capabilities.hoverProvider = false
        end,
      }

      lspconfig.yamlls.setup {
        capabilities = capabilities(),
      }
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
    },
  },

  {
    "j-hui/fidget.nvim",
    event = { "LspAttach" },
    opts = {
      progress = {
        suppress_on_insert = true,
      },
    },
  },

  {
    "kosayoda/nvim-lightbulb",
    event = { "LspAttach" },
    opts = {
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = true,
        hl = "CursorLine",
      },
      autocmd = {
        enabled = true,
        updatetime = vim.o.updatetime,
      },
    },
  },
}
