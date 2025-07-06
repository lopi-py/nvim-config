local function rojo_project()
  return vim.fs.root(0, function(name)
    return name:match ".+%.project%.json$"
  end)
end

return {
  "lopi-py/luau-lsp.nvim",
  ft = "luau",
  opts = {
    platform = {
      type = rojo_project() and "roblox" or "standard",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}
