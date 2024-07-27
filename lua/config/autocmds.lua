local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufReadPost", "BufNewFile" }, {
  once = true,
  callback = function()
    vim.schedule(function()
      vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      vim.api.nvim_exec_autocmds("FileType", {})
    end)
  end,
})

autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  command = "checktime",
})
