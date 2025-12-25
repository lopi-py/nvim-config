return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  opts = {
    linters_by_ft = {
      lua = { "selene", "luacheck" },
      luau = { "selene" },
    },
    linters = {
      selene = {
        condition = function(_, bufnr)
          return vim.fs.root(bufnr, "selene.toml")
        end,
      },
      luacheck = {
        condition = function(_, bufnr)
          return vim.fs.root(bufnr, ".luacheckrc")
        end,
      },
    },
  },
  config = function(_, opts)
    local lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft
    for name, linter in pairs(opts.linters) do
      if type(lint.linters[name]) == "table" then
        lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
      else
        lint.linters[name] = linter
      end
    end

    lint._resolve_linter_by_ft = function(ft)
      return vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        if type(linter) == "table" and linter.condition then
          return linter:condition(vim.api.nvim_get_current_buf())
        end
        return true
      end, lint.linters_by_ft[ft] or {})
    end

    local function debounce(ms, fn)
      local timer = assert(vim.uv.new_timer())
      return function(...)
        local args = vim.F.pack_len(...)
        timer:stop()
        timer:start(
          ms,
          0,
          vim.schedule_wrap(function()
            fn(vim.F.unpack_len(args))
          end)
        )
      end
    end

    vim.api.nvim_create_autocmd({ "BufRead", "InsertLeave", "TextChanged" }, {
      callback = debounce(150, function(event)
        if vim.api.nvim_buf_is_valid(event.buf) then
          vim.api.nvim_buf_call(event.buf, lint.try_lint)
        end
      end),
    })
    lint.try_lint()
  end,
}
