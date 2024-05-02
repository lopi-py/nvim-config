return {
  {
    "echasnovski/mini.comment",
    event = { "VeryLazy" },
    opts = {
      options = {
        custom_commentstring = function()
          return require("ts_context_commentstring").calculate_commentstring()
            or vim.bo.commentstring
        end,
        ignore_blank_line = true,
      },
    },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = {
          enable_autocmd = false,
        },
        init = function()
          vim.g.skip_ts_context_commentstring_module = true
        end,
      },
    },
  },
}
