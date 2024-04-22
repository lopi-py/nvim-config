local config = require "config"
local util = require "util"

return {
  {
    "mfussenegger/nvim-lint",
    event = { "LazyFile" },
    opts = {
      linters_by_ft = {
        lua = { "selene" },
        luau = { "selene" },
      },
      linters = {},
    },
    config = function(_, opts)
      local lint = require "lint"
      lint.linters_by_ft = opts.linters_by_ft

      for name, linter in ipairs(opts.linters) do
        lint.linters[name] = linter
      end

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile", "TextChanged", "InsertLeave" }, {
        callback = util.debounced(
          config.text_debounce,
          vim.schedule_wrap(function(event)
            if util.is_file(event.buf) then
              vim.api.nvim_buf_call(event.buf, lint.try_lint)
            end
          end)
        ),
      })

      if util.is_file(vim.api.nvim_get_current_buf()) then
        lint.try_lint()
      end
    end,
  },
}
