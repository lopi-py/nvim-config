local M = {}

function M.capabilities()
  return vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities(),
    {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }
  )
end

local function on_attach(_, bufnr)
  local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
  end

  map("n", "gd", ":Telescope lsp_definitions<cr>")
  map("n", "gD", vim.lsp.buf.declaration)
  map("n", "gi", ":Telescope lsp_implementations<cr>")
  map("n", "gy", ":Telescope lsp_type_definitions<cr>")
  map("n", "grr", ":Telescope lsp_references<cr>")
  map("n", "grn", vim.lsp.buf.rename)
  map({ "n", "v" }, "gra", vim.lsp.buf.code_action)
  map("i", "<c-s>", vim.lsp.buf.signature_help)
end

vim.lsp.inlay_hint.enable(true)

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
