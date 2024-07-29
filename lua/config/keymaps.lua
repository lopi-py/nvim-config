require("util").patch_keymap_set()

local map = vim.keymap.set

map("n", "<esc>", ":nohlsearch<cr><esc>")
map("n", "<leader>w", vim.cmd.write)
map("n", "<tab>", vim.cmd.tabnext)
map("n", "<s-tab>", vim.cmd.tabprevious)
map("n", "<leader>tx", vim.cmd.tabclose)
map("n", "<leader>bx", vim.cmd.bdelete)
map("n", "<bs>", ":e #<cr>")

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
  vim.g.disable_autoformat = not vim.g.disable_autoformat
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
