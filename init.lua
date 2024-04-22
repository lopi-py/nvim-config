vim.loader.enable()

require "config.options"
require "config.keymaps"
require "config.autocmds"
require "lazy-bootstrap"

vim.cmd.colorscheme "catppuccin-mocha"
