return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    local cmp = require "cmp"
    local cmp_npairs = require "nvim-autopairs.completion.cmp"

    cmp.event:on("confirm_done", cmp_npairs.on_confirm_done())
  end,
}
