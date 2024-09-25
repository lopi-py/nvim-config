return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<leader>/", "<cmd>Telescope live_grep<cr>" },
    { "<leader>,", "<cmd>Telescope buffers sort_mru=true<cr>" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>" },
    { "<leader>fr", "<cmd>Telescope oldfiles cwd_only=true<cr>" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>" },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>" },
    { "<leader>gC", "<cmd>Telescope git_bcommits<cr>" },
    { "<leader>gs", "<cmd>Telescope git_status<cr>" },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>" },
  },
  cmd = "Telescope",
  opts = {},
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "fzf"
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}
