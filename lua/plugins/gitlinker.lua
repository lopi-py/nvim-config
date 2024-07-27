return {
  "linrongbin16/gitlinker.nvim",
  keys = {
    { "<leader>gy", ":GitLink file<cr>" },
    { "<leader>gY", ":GitLink! file<cr>" },
    { "<leader>gy", ":GitLink<cr>", mode = { "v" } },
    { "<leader>gY", ":GitLink!<cr>", mode = { "v" } },
  },
  cmd = "GitLink",
  opts = {
    message = false,
    router = {
      file = {
        ["^github%.com"] = "https://github.com/{_A.ORG}/{_A.REPO}/blob/{_A.REV}/{_A.FILE}",
      },
    },
  },
}
