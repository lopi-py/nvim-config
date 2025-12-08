return {
  "folke/snacks.nvim",
  lazy = false,
  keys = {
    { "<leader><leader>", "<cmd>lua Snacks.picker.smart({ filter = { cwd = true } })<cr>" },
    { "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>" },
    { "<leader>:", "<cmd>lua Snacks.picker.command_history()<cr>" },
    { "<leader>e", "<cmd>lua Snacks.explorer()<cr>" },

    { "<leader>fb", "<cmd>lua Snacks.picker.buffers()<cr>" },
    { "<leader>ff", "<cmd>lua Snacks.picker.files()<cr>" },
    { "<leader>fg", "<cmd>lua Snacks.picker.git_files()<cr>" },
    { "<leader>fp", "<cmd>lua Snacks.picker.projects()<cr>" },
    { "<leader>fr", "<cmd>lua Snacks.picker.recent({ filter = { cwd = true } })<cr>" },

    { "<leader>gb", "<cmd>lua Snacks.picker.git_branches()<cr>" },
    { "<leader>gc", "<cmd>lua Snacks.picker.git_log()<cr>" },
    { "<leader>gC", "<cmd>lua Snacks.picker.git_log_file()<cr>" },
    { "<leader>gs", "<cmd>lua Snacks.picker.git_status()<cr>" },
    { "<leader>gS", "<cmd>lua Snacks.picker.git_stash()<cr>" },

    { "<leader>gi", "<cmd>lua Snacks.picker.gh_issue()<cr>" },
    { "<leader>gp", "<cmd>lua Snacks.picker.gh_pr()<cr>" },

    { "<leader>sb", "<cmd>lua Snacks.picker.grep_buffers()<cr>" },
    { "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<cr>" },
    { "<leader>sD", "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>" },
    { "<leader>sh", "<cmd>lua Snacks.picker.help()<cr>" },
    { "<leader>sm", "<cmd>lua Snacks.picker.man()<cr>" },
    { "<leader>sp", "<cmd>lua Snacks.picker.lazy()<cr>" },
    { "<leader>sq", "<cmd>lua Snacks.picker.qflist()<cr>" },
    { "<leader>su", "<cmd>lua Snacks.picker.undo()<cr>" },
    { "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>" },
  },
  opts = {
    picker = {
      prompt = " ",
      previewers = {
        diff = {
          style = "terminal",
        },
      },
      win = {
        preview = {
          wo = { signcolumn = "no", wrap = false },
        },
      },
      icons = {
        ui = {
          selected = "+ ",
          unselected = "  ",
        },
        diagnostics = {
          Error = "E",
          Warn = "W",
          Hint = "H",
          Info = "I",
        },
      },
    },
  },
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
