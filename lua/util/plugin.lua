local M = {}

function M.lazy_file()
  local Event = require "lazy.core.handler.event"
  Event.mappings.LazyFile = { id = "LazyFile", event = "User", pattern = "LazyFile" }

  local events = {}
  local done = false

  local function load()
    if #events == 0 or done then
      return
    end

    done = true
    vim.api.nvim_del_augroup_by_name "lazy_file"

    ---@type table<string,string[]>
    local skips = {}
    for _, event in ipairs(events) do
      skips[event.event] = skips[event.event] or Event.get_augroups(event.event)
    end

    vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile", modeline = false })
    for _, event in ipairs(events) do
      if vim.api.nvim_buf_is_valid(event.buf) then
        Event.trigger {
          event = event.event,
          exclude = skips[event.event],
          data = event.data,
          buf = event.buf,
        }
        if vim.bo[event.buf].filetype then
          Event.trigger {
            event = "FileType",
            buf = event.buf,
          }
        end
      end
    end
    vim.api.nvim_exec_autocmds("CursorMoved", { modeline = false })
    events = {}
  end

  vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufWritePre" }, {
    group = vim.api.nvim_create_augroup("lazy_file", {}),
    callback = function(event)
      table.insert(events, event)
      vim.schedule(load)
    end,
  })
end

return M
