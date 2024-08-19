require("util").patch_keymap_set()

local map = vim.keymap.set

map("n", "<esc>", ":nohlsearch<cr><esc>")
map("n", "<c-h>", vim.cmd.tabprevious)
map("n", "<c-l>", vim.cmd.tabnext)
map("n", "<tab>", ":e #<cr>")
map("n", "<bs>", vim.cmd.bdelete)

map("t", "<c-w>", "<c-\\><c-n><c-w>", { remap = true })

map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
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

map({ "i", "s" }, "<c-j>", function()
  if vim.snippet.active { direction = 1 } then
    vim.snippet.jump(1)
  end
end)
map({ "i", "s" }, "<c-k>", function()
  if vim.snippet.active { direction = -1 } then
    vim.snippet.jump(-1)
  end
end)
