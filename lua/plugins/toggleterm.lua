return {
  "akinsho/toggleterm.nvim",
  keys = {
    { "<a-t>", ":ToggleTerm<cr>", desc = "toggle terminal" },
  },
  opts = {
    open_mapping = "<a-t>",
    direction = "horizontal",
    size = 20,
    winbar = {
      enabled = true,
    },
  },
  init = function()
    if vim.uv.os_uname().sysname == "Windows_NT" then
      vim.o.shell = "pwsh"
      vim.o.shellcmdflag =
        "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
      vim.o.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
      vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
      vim.o.shellquote = ""
      vim.o.shellxquote = ""
    end
  end,
}
