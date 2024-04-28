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

  {
    "kosayoda/nvim-lightbulb",
    event = { "LspAttach" },
    opts = {
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = true,
        hl = "CursorLine",
      },
      autocmd = {
        enabled = true,
        updatetime = vim.o.updatetime,
      },
    },
  },
}
