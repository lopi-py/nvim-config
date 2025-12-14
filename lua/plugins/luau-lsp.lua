local rojo_project = vim.fs.root(0, function(name)
  return name:match ".+%.project%.json$"
end)

if rojo_project then
  vim.filetype.add {
    extension = {
      lua = function(path)
        return path:match "%.nvim%.lua$" and "lua" or "luau"
      end,
    },
  }
end

return {
  "lopi-py/luau-lsp.nvim",
  ft = "luau",
  opts = {
    platform = {
      type = rojo_project and "roblox" or "standard",
    },
  },
}
