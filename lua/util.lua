local M = {}

---@param bufnr number
---@return boolean
function M.is_file(bufnr)
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return false
  end

  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == "" or vim.bo[bufnr].buftype ~= "" then
    return false
  end

  return true
end

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
