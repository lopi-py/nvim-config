---@class lint.Linter
---@field condition? fun(self: lint.Linter, bufnr: number): boolean

return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",
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
          return vim.fs.root(bufnr, ".luacheck")
        end,
      },
    },
  },
  config = function(_, opts)
    local lint = require "lint"
    lint.linters_by_ft = opts.linters_by_ft

    for name, linter in pairs(opts.linters) do
      if type(linter) == "table" and type(lint.linters[name]) == "table" then
        lint.linters[name] = vim.tbl_deep_extend("force", lint.linters[name], linter)
      else
        lint.linters[name] = linter
      end
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

    local function try_lint()
      local names = vim.tbl_filter(function(name)
        local linter = lint.linters[name]
        if type(linter) == "table" and linter.condition then
          return linter:condition(vim.api.nvim_get_current_buf())
        end

        return true
      end, lint._resolve_linter_by_ft(vim.bo.filetype))

      if #names > 0 then
        lint.try_lint(names)
      end
    end

    vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "TextChanged" }, {
      callback = debounce(100, try_lint),
    })

    try_lint()
  end,
}
