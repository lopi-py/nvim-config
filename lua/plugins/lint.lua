return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",
  opts = {
    linters_by_ft = {},
    linters = {},
  },
  config = function(_, opts)
    local lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft

    for name, linter in ipairs(opts.linters) do
      lint.linters[name] = linter
    end

    local function debounce(ms, callback)
      local timer = vim.uv.new_timer()
      return function(...)
        local args = { ... }
        timer:stop()
        timer:start(ms, 0, function()
          vim.schedule_wrap(callback)(unpack(args))
        end)
      end
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged" }, {
      callback = debounce(100, function()
        lint.try_lint()
      end),
    })

    lint.try_lint()
  end,
}
