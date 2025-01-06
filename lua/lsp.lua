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
  signs = false,
  float = {
    source = true,
  },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local function map(mode, lhs, rhs)
      vim.keymap.set(mode, lhs, rhs, { buffer = event.buf })
    end

    map("i", "<ctrl-s>", vim.lsp.buf.signature_help)
    map("n", "grn", vim.lsp.buf.rename)
    map("n", "gra", vim.lsp.buf.code_action)
    map("n", "gd", "<cmd>FzfLua lsp_definitions jump_to_single_result=true<cr>")
    map("n", "gD", "<cmd>FzfLua lsp_declarations jump_to_single_result=true<cr>")
    map("n", "gy", "<cmd>FzfLua lsp_typedefs jump_to_single_result=true<cr>")
    map("n", "grr", "<cmd>FzfLua lsp_references jump_to_single_result=true<cr>")
    map("n", "gri", "<cmd>FzfLua lsp_implementations jump_to_single_result=true<cr>")
    map("n", "gO", "<cmd>FzfLua lsp_document_symbols<cr>")
  end,
})

return M
