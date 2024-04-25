require("util").patch_keymap_set()

local map = vim.keymap.set

vim.g.mapleader = " "

map("n", "[b", vim.cmd.bprevious)
map("n", "]b", vim.cmd.bnext)
map("n", "[t", vim.cmd.tabprevious)
map("n", "]t", vim.cmd.tabnext)

map("n", "<leader>tn", vim.cmd.tabnew)
map("n", "<leader>tc", vim.cmd.tabclose)
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")
map("n", "<leader>w", vim.cmd.write, { desc = "Save" })
map("n", "<leader>W", vim.cmd.wall, { desc = "Save all" })
map("n", "<leader>q", vim.cmd.quit, { desc = "Quit" })
map("n", "<leader>x", vim.cmd.quitall, { desc = "Quit all" })
map("n", "<c-n>", vim.cmd.enew)
map("n", "<leader>bp", vim.cmd.bprevious)
map("n", "<leader>bn", vim.cmd.bnext)
map("n", "<leader>br", vim.cmd.edit)
map("n", "<bs>", function()
  vim.cmd.edit "#"
end)

map("n", "<a-j>", "<cmd>m .+1<cr>==")
map("n", "<a-k>", "<cmd>m .-2<cr>==")
map("i", "<a-j>", "<esc><cmd>m .+1<cr>==gi")
map("i", "<a-k>", "<esc><cmd>m .-2<cr>==gi")
map("v", "<a-j>", ":m '>+1<cr>gv=gv")
map("v", "<a-k>", ":m '<-2<cr>gv=gv")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("t", "<c-w>", "<c-\\><c-n><c-w>", { remap = true })
