local schemas = {
  {
    name = "default.project.json",
    fileMatch = { "*.project.json" },
    url = "https://raw.githubusercontent.com/rojo-rbx/vscode-rojo/master/schemas/project.template.schema.json",
  },
  {
    name = ".emmyrc.json",
    fileMatch = { ".emmyrc.json" },
    url = "https://raw.githubusercontent.com/EmmyLuaLs/emmylua-analyzer-rust/refs/heads/main/crates/emmylua_code_analysis/resources/schema.json",
  },
}

return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas { extra = schemas },
      validate = { enable = true },
    },
  },
}
