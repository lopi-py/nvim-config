return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    integrations = {
      blink_cmp = true,
      fzf = true,
    },
  },

  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end,
}
