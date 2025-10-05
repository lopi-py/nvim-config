return {
  "folke/sidekick.nvim",
  event = "VeryLazy",
  keys = {
    {
      "<tab>",
      function()
        if not require("sidekick").nes_jump_or_apply() then
          return "<tab>"
        end
      end,
      expr = true,
    },
  },
  opts = {
    signs = {
      enabled = false,
    },
  },
}
