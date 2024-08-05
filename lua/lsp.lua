local M = {}

---@return lsp.ClientCapabilities
function M.capabilities()
  local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )

  return vim.tbl_deep_extend("force", capabilities, {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  })
end

---@param client vim.lsp.Client
---@param bufnr number
local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gy", vim.lsp.buf.type_definition)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "<leader>rn", vim.lsp.buf.rename)
  map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
  map("i", "<c-s>", vim.lsp.buf.signature_help)

  if client.supports_method "textDocument/documentHighlight" then
    local group = vim.api.nvim_create_augroup("lsp/documentHighlight/" .. bufnr, {})
    vim.api.nvim_create_autocmd({ "CursorHold", "InsertLeave" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })
    vim.api.nvim_create_autocmd({ "CursorMoved", "InsertEnter", "BufLeave" }, {
      group = group,
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
  end
end

vim.diagnostic.config {
  signs = false,
  float = {
    source = true,
    border = "rounded",
  },
}

---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
  contents = vim.lsp.util._normalize_markdown(contents, {
    width = vim.lsp.util._make_floating_popup_size(contents, opts),
  })
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)
  vim.treesitter.start(bufnr, "markdown")

  return contents
end

local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return
  end

  on_attach(client, vim.api.nvim_get_current_buf())

  return register_capability(err, result, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    on_attach(client, event.buf)
  end,
})

return M
