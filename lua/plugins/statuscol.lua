local util = require "util"

return {
  {
    "luukvbaal/statuscol.nvim",
    lazy = false,
    branch = "0.10",
    opts = function()
      local builtin = require "statuscol.builtin"

      return {
        relculright = true,
        bt_ignore = { "nofile" },
        segments = {
          {
            text = { builtin.foldfunc, " " },
            click = "v:lua.ScFa",
          },
          {
            text = { builtin.lnumfunc, " " },
            click = "v:lua.ScLa",
          },
          {
            sign = { namespace = { "gitsigns" } },
            click = "v:lua.ScSa",
            condition = {
              function(args)
                return util.is_file(args.buf)
              end,
            },
          },
        },
      }
    end,
  },
}
