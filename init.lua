vim.loader.enable()

require "config.options"
require "config.keymaps"
require "config.autocmds"

require("config.lazy").setup {
  { import = "plugins.extras.lua" },
  { import = "plugins.extras.luau" },
  { import = "plugins.extras.clang" },
  { import = "plugins.extras.typescript" },
  { import = "plugins.extras.json" },
  { import = "plugins.extras.yaml" },
}
