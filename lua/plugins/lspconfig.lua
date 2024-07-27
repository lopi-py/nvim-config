local function get_json_schemas()
  local schemas = require("schemastore").json.schemas()

  table.insert(schemas, {
    fileMatch = { "*.project.json" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  })

  return schemas
end

return {
  "neovim/nvim-lspconfig",
  event = "User FilePost",
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
          validate = { enable = true },
        },
      },
    }

    lspconfig.lua_ls.setup {
      capabilities = capabilities(),
      settings = {
        Lua = {
          workspace = {
            checkThirdParty = false,
          },
        },
      },
    }

    lspconfig.pyright.setup {
      capabilities = capabilities(),
    }

    lspconfig.ruff.setup {
      capabilities = capabilities(),
      on_attach = function(client)
        client.server_capabilities.hoverProvider = false
      end,
    }

    lspconfig.vtsls.setup {
      capabilities = capabilities(),
    }

    lspconfig.yamlls.setup {
      capabilities = capabilities(),
    }
  end,
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "b0o/SchemaStore.nvim",
  },
}
