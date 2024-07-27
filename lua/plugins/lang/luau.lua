---@diagnostic disable-next-line: param-type-mismatch
local rojo_project = vim.fs.root(vim.uv.cwd(), function(path)
  return path:match "%.project.json$"
end)

return {
  "lopi-py/luau-lsp.nvim",
  event = "User FilePost",
  opts = function()
    return {
      platform = {
        type = rojo_project and "roblox" or "standard",
      },
      sourcemap = {
        enabled = rojo_project ~= nil,
      },
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
    }
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
}
