local M = {}

function M.patch_keymap_set()
  local keymap_set = vim.keymap.set
  ---@diagnostic disable-next-line: duplicate-set-field
  vim.keymap.set = function(mode, lhs, rhs, opts)
    opts = opts or {}
    opts.silent = vim.F.if_nil(opts.silent, true)
    keymap_set(mode, lhs, rhs, opts)
  end
end

return M
