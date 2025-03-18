return {
  "folke/snacks.nvim",
  lazy = false,
  keys = {
    { "<leader><leader>", "<cmd>lua Snacks.picker.smart({ filter = { cwd = true } })<cr>" },
    { "<leader>/", "<cmd>lua Snacks.picker.grep()<cr>" },
    { "<leader>:", "<cmd>lua Snacks.picker.command_history()<cr>" },

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

    { "<leader>sb", "<cmd>lua Snacks.picker.lines()<cr>" },
    { "<leader>sB", "<cmd>lua Snacks.picker.grep_buffers()<cr>" },
    { "<leader>sp", "<cmd>lua Snacks.picker.lazy()<cr>" },
    { "<leader>sw", "<cmd>lua Snacks.picker.grep_word()<cr>" },

    { "<leader>sd", "<cmd>lua Snacks.picker.diagnostics()<cr>" },
    { "<leader>sD", "<cmd>lua Snacks.picker.diagnostics_buffer()<cr>" },
    { "<leader>sm", "<cmd>lua Snacks.picker.man()<cr>" },
    { "<leader>su", "<cmd>lua Snacks.picker.undo()<cr>" },

    { "<leader>e", "<cmd>lua Snacks.explorer()<cr>" },
    { "<bs>", "<cmd>lua Snacks.bufdelete()<cr>" },
  },
  opts = {
    picker = {
      prompt = " ",
      win = {
        preview = {
          wo = {
            signcolumn = "no",
            wrap = false,
          },
        },
      },
      icons = {
        diagnostics = {
          Error = "E",
          Warn = "W",
          Hint = "H",
          Info = "I",
        },
      },
    },
  },
}
