local M = {}

function M.capabilities()
  return vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("blink.cmp").get_lsp_capabilities(),
    {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }
  )
end

vim.diagnostic.config {
  virtual_text = {
    current_line = true,
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
    end

    map("n", "gd", "<cmd>lua Snacks.picker.lsp_definitions() <cr>")
    map("n", "gD", "<cmd>lua Snacks.picker.lsp_declarations()<cr>")
    map("n", "gy", "<cmd>lua Snacks.picker.lsp_type_definitions<cr>")
    map("n", "grr", "<cmd>lua Snacks.picker.lsp_references()<cr>")
    map("n", "gri", "<cmd>lua Snacks.picker.lsp_implementations()<cr>")
    map("n", "gO", "<cmd>lua Snacks.picker.lsp_symbols()<cr>")
  end,
})

return M
