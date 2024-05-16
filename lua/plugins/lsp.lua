return {
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>tt", ":TroubleToggle<cr>", desc = "Troggle trouble" },
    },
    opts = {
      use_diagnostic_signs = true,
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
