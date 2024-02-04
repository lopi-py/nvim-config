local icons = require "config.icons"
local util = require "util"

local lazy_root = util.path_join(vim.fn.stdpath "data", "lazy")
local lazy_path = util.path_join(lazy_root, "lazy.nvim")
local dev_path = util.path_join(util.on_windows and "F:" or "~", "dev", "nvim")

if not util.path_exists(lazy_path) then
  vim
    .system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      lazy_path,
    })
    :wait()
end

vim.opt.rtp:append(lazy_path)

require("util.plugin").lazy_file()

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.extras" },
}, {
  root = lazy_root,
  defaults = {
    lazy = true,
  },
  dev = {
    path = dev_path,
    patterns = { "lopi-py" },
  },
  ui = {
    border = icons.border,
  },
  change_detection = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "rplugin",
        "spellfile",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
