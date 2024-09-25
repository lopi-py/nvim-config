local function rojo_project()
  return vim.fs.root(0, function(name)
    return name:match ".+%.project%.json$"
  end)
end

return {
  "lopi-py/luau-lsp.nvim",
  ft = "luau",
  opts = function()
    local capabilities = require("lsp").capabilities()
    return {
      platform = {
        type = rojo_project() and "roblox" or "standard",
      },
      server = {
        capabilities = capabilities,
        settings = {
          ["luau-lsp"] = {
            ignoreGlobs = { "**/_Index/**", "node_modules/**" },
            completion = {
              imports = {
                enabled = true,
                ignoreGlobs = { "**/_Index/**", "node_modules/**" },
              },
            },
            require = {
              mode = "relativeToFile",
              directoryAliases = require("luau-lsp").aliases(),
            },
            inlayHints = {
              functionReturnTypes = true,
              parameterTypes = true,
            },
          },
        },
      },
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
