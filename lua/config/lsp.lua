local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  map("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>")
  map("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>")
  map("n", "grr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
  map("n", "gri", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
  map("n", "grt", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>")
  map("n", "grc", vim.lsp.document_color.color_presentation)
  map("n", "gO", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")

  if client.name == "clangd" then
    vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>")
  end

  if client:supports_method "textDocument/foldingRange" then
    local win = vim.api.nvim_get_current_win()
    vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
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

vim.lsp.document_color.enable(false)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client then
      on_attach(client, event.buf)
    end
  end,
})
