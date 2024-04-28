local config = require "config"

local M = {}
M.on_windows = vim.loop.os_uname().sysname == "Windows_NT"

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

---@param bufnr number
---@return boolean
function M.within_fsize(bufnr)
  local success, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
  if success and stats and stats.size > config.max_file_size then
    return false
  end
  return true
end

---@vararg string
---@return string
function M.path_join(...)
  return table.concat({ ... }, M.on_windows and "\\" or "/")
end

---@param path string
---@return boolean
function M.path_exists(path)
  return vim.loop.fs_stat(path) ~= nil
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
