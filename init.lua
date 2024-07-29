require "config.options"
require "config.keymaps"
require "config.autocmds"

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim
    .system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      lazypath,
    })
    :wait()
end
vim.opt.rtp:append(lazypath)

require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.language" },
}, {
  defaults = { lazy = true },
  dev = {
    path = "~/dev/nvim",
    patterns = { "lopi-py" },
    fallback = true,
  },
  change_detection = { enabled = false },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "netrwPlugin",
        "rplugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

vim.cmd.colorscheme "catppuccin"
