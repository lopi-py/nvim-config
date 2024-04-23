return {
  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>tt", ":TroubleToggle<cr>", desc = "Troggle trouble" },
    },
    cmd = { "TroubleToggle" },
    opts = {
      height = 15,
      use_diagnostic_signs = true,
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    "kosayoda/nvim-lightbulb",
    event = { "LspAttach" },
    opts = {
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = false,
        hl = "CursorLine",
      },
      autocmd = {
        enabled = true,
      },
    },
  },
}
