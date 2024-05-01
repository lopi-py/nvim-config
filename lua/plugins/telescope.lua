local config = require "config"

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>" },
      { "<leader>fg", ":Telescope live_grep<cr>" },
      { "<leader>fw", ":Telescope grep_string<cr>" },
      { "<leader>fc", ":Telescope git_commits<cr>" },
      { "<leader>fC", ":Telescope git_bcommits<cr>" },
      { "<leader>fb", ":Telescope git_branches<cr>" },
      { "<leader>fs", ":Telescope git_status<cr>" },
      { "<leader><leader>", ":Telescope buffers<cr>" },
    },
    cmd = { "Telescope" },
    opts = {
      defaults = {
        file_ignore_pattern = config.ignored_files,
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
