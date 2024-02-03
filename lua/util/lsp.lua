local M = {}

function M.patch_settings(name, patcher)
  local function patch_settings(client)
    client.config.settings = patcher(client.config.settings)
    client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
  end

  local clients = vim.lsp.get_clients { name = name }
  if #clients > 0 then
    patch_settings(clients[1])
    return
  end

  local group = vim.api.nvim_create_augroup(string.format("lsp-patch-settings.%s", name), {})

  vim.api.nvim_create_autocmd("LspAttach", {
    group = group,
    callback = function(ev)
      local client = vim.lsp.get_client_by_id(ev.data.client_id)
      if client and client.name == name then
        patch_settings(client)
        return true
      end
    end,
  })
end

return M
