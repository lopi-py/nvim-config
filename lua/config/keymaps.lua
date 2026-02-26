local map = vim.keymap.set

map("n", "<bs>", "<cmd>edit #<cr>")
map("n", "<esc>", "<cmd>nohlsearch<cr><esc>")
map("n", "<leader>q", vim.diagnostic.setqflist)

map("n", "<leader>ud", function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end)
map("n", "<leader>uh", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
map("n", "<leader>ui", function()
  vim.lsp.inline_completion.enable(not vim.lsp.inline_completion.is_enabled())
end)
map("n", "<leader>uc", function()
  vim.lsp.document_color.enable(not vim.lsp.document_color.is_enabled())
end)
map("n", "<leader>uw", function()
  vim.o.wrap = not vim.o.wrap
end)
map("n", "<leader>uf", function()
  vim.g.autoformat = not vim.g.autoformat
end)
map("n", "<leader>uu", vim.cmd.Undotree)

map("n", "[e", function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR }
end)
map("n", "]e", function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR }
end)

map("n", "<leader>yf", function()
  vim.fn.setreg("+", vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":."))
end)
map("n", "<leader>yl", function()
  vim.fn.setreg(
    "+",
    vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.") .. ":" .. vim.fn.line "."
  )
end)
map("x", "<leader>yl", function()
  local lstart = vim.fn.line "v"
  local lend = vim.fn.line "."
  if lstart > lend then
    lstart, lend = lend, lstart
  end
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "nx", false)
  local suffix = lstart == lend and (":" .. lstart) or (":" .. lstart .. "-" .. lend)
  vim.fn.setreg("+", vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":.") .. suffix)
end)

map("t", "<c-w>", "<c-\\><c-n><c-w>", { remap = true })
