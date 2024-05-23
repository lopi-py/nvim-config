require("util").patch_keymap_set()

local map = vim.keymap.set

map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

map("n", "<leader>w", vim.cmd.write)

map("n", "<tab>", vim.cmd.tabnext)
map("n", "<s-tab>", vim.cmd.tabprevious)

map("n", "<leader>tx", vim.cmd.tabclose)
map("n", "<leader>bp", vim.cmd.bprevious)
map("n", "<leader>bn", vim.cmd.bnext)
map("n", "<leader>br", vim.cmd.edit)
map("n", "<leader>bx", vim.cmd.bdelete)
map("n", "<bs>", ":e #<cr>")

map("t", "<c-w>", "<c-\\><c-n><c-w>", { remap = true })

map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled {})
end)
map("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
map("n", "<leader>ui", function()
  vim.cmd.IBLToggle()
end)
map("n", "<leader>uw", function()
  vim.o.wrap = not vim.o.wrap
end)
map("n", "<leader>uf", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
end)
