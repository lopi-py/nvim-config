local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufReadPost", "BufWritePost" }, {
  once = true,
  callback = vim.schedule_wrap(function()
    vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
    vim.api.nvim_exec_autocmds("FileType", {})
  end),
})
