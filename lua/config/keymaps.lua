local map = vim.keymap.set

map("n", "<bs>", "<cmd>edit #<cr>")
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
map("n", "<c-h>", vim.cmd.tabprevious)
map("n", "<c-l>", vim.cmd.tabnext)
map("n", "<leader>q", vim.diagnostic.setqflist)

map("t", "<c-w>", "<c-\\><c-n><c-w>", { remap = true })

map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
map("n", "<leader>uc", function()
  vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled())
end)
map("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
map("n", "<leader>uw", function()
  vim.o.wrap = not vim.o.wrap
end)
map("n", "<leader>uf", function()
  vim.g.autoformat = not vim.g.autoformat
end)

map("n", "[e", function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
end)
map("n", "]e", function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
end)
