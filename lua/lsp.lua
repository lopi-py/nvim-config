local icons = require "config.icons"

local M = {}

---@param overrides lsp.ClientCapabilities?
---@return lsp.ClientCapabilities
function M.capabilities(overrides)
  local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }

  if overrides then
    return vim.tbl_deep_extend("force", capabilities, overrides)
  else
    return capabilities
  end
end

---@param client vim.lsp.Client
---@param bufnr number
local function on_attach(client, bufnr)
  local function map(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gi", vim.lsp.buf.implementation)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gy", vim.lsp.buf.type_definition)
  map("n", "K", vim.lsp.buf.hover)
  map("n", "<c-k>", vim.lsp.buf.signature_help)

  map("n", "<leader>cd", vim.diagnostic.open_float)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "]d", vim.diagnostic.goto_next)
  map("n", "[e", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  end)
  map("n", "]e", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  end)

  if client.supports_method "textDocument/codeAction" then
    map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
  end

  if client.supports_method "textDocument/rename" then
    map("n", "<leader>cr", vim.lsp.buf.rename)
  end

  if client.supports_method "textDocument/inlayHint" then
    -- NOTE: https://github.com/neovim/neovim/pull/28461
    vim.lsp.inlay_hint.enable(bufnr, true)
  end
end

for name, icon in pairs(icons.diagnostics) do
  name = "DiagnosticSign" .. name:sub(1, 1):upper() .. name:sub(2)
  vim.fn.sign_define(name, { text = icon, texthl = name })
end

vim.diagnostic.config {
  signs = false,
  float = {
    border = icons.border,
  },
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = icons.border,
  silent = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = icons.border,
})

local register_capability = vim.lsp.handlers["client/registerCapability"]
vim.lsp.handlers["client/registerCapability"] = function(err, result, ctx)
  local client = vim.lsp.get_client_by_id(ctx.client_id)
  if not client then
    return
  end

  on_attach(client, ctx.bufnr)

  return register_capability(err, result, ctx)
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    on_attach(client, args.buf)
  end,
})

return M
