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
          click = "v:lua.ScFa",
        },
        {
          sign = {
            name = { ".*" },
            text = { ".*" },
            auto = true,
          },
          click = "v:lua.ScSa",
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
}
