local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  map("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions() <cr>")
  map("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>")
  map("n", "gy", "<cmd>lua Snacks.picker.lsp_type_definitions<cr>")
  map("n", "grr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
  map("n", "gri", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
  map("n", "gO", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")

  if client.name == "clangd" then
    vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>")
  end
end

vim.lsp.config("*", {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

vim.diagnostic.config {
  virtual_text = {
    current_line = true,
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      on_attach(client, event.buf)
    end
  end,
})
