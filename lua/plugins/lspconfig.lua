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

      lspconfig.eslint.setup {
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

      lspconfig.yamlls.setup {
        capabilities = capabilities(),
      }
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "b0o/SchemaStore.nvim",
    },
  },
}
