vim.lsp.inline_completion.enable()
vim.lsp.on_type_formatting.enable()

vim.diagnostic.config {
  virtual_text = {
    current_line = true,
  },
}

vim.lsp.config("*", {
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
    end

    map("i", "<m-y>", vim.lsp.inline_completion.get)
    map("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions()<cr>")
    map("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>")
    map("n", "gri", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
    map("n", "grr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
    map("n", "grt", "<cmd>lua Snacks.picker.lsp_type_definitions()<cr>")
    map("n", "gai", "<cmd>lua Snacks.picker.lsp_incoming_calls()<cr>")
    map("n", "gao", "<cmd>lua Snacks.picker.lsp_outgoing_calls()<cr>")
    map("n", "gO", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")
    map("n", "ss", "<cmd>lua Snacks.picker.lsp_workspace_symbols()<cr>")

    if client:supports_method "textDocument/foldingRange" then
      vim.wo[0][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    if client.name == "clangd" then
      map("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<cr>")
    end
  end,
})
