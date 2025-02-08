return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd.colorscheme "tokyonight"
  end,
}
