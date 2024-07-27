local util = require "util"

return {
  "luukvbaal/statuscol.nvim",
  lazy = false,
  branch = "0.10",
  opts = function()
    local builtin = require "statuscol.builtin"

    return {
      relculright = true,
      segments = {
        {
          text = { builtin.foldfunc, " " },
        },
        {
          sign = {
            name = { ".*" },
            text = { ".*" },
            auto = true,
          },
        },
        {
          text = { builtin.lnumfunc, " " },
        },
        {
          sign = { namespace = { "gitsigns" } },
          condition = {
            function(args)
              return util.is_file(args.buf)
            end,
          },
        },
      },
    }
  end,
}
