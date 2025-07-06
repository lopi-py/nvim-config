local schemas = {
  {
    name = "default.project.json",
    description = "JSON schema for Rojo project files",
    fileMatch = { "*.project.json" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  },
}

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas { extra = schemas },
      validate = {
        enable = true,
      },
    },
  },
}
