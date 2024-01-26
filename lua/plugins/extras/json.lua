local rojo_schemas = {
  {
    fileMatch = { "*.project.json", "*.project.jsonc" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  },
}

return {
  "b0o/SchemaStore.nvim",

  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, { "json", "json5", "jsonc" })
  end,

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jsonls = {
          on_new_config = function(new_config)
            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
            vim.list_extend(new_config.settings.json.schemas, rojo_schemas)
          end,
        },
      },
    },
  },
}
