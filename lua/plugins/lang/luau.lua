local function find_rojo_file()
  local cwd = assert(vim.uv.cwd())
  return vim.fs.root(cwd, function(path)
    return path:match "%.project.json$"
  end)
end

return {
  {
    "lopi-py/luau-lsp.nvim",
    event = { "LazyFile" },
    opts = function()
      local rojo_file = find_rojo_file()

      return {
        server = {
          capabilities = require("lsp").capabilities(),
          settings = {
            ["luau-lsp"] = {
              ignoreGlobs = { "**/_Index/**", "**/node_modules/**" },
              completion = {
                imports = {
                  enabled = true,
                  ignoreGlobs = { "**/_Index/**", "**/node_modules/**" },
                },
              },
              inlayHints = {
                functionReturnTypes = true,
                parameterTypes = true,
              },
            },
          },
        },
        platform = {
          type = rojo_file and "roblox" or "standard",
        },
        sourcemap = {
          enabled = rojo_file ~= nil,
        },
      }
    end,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
  },
}
