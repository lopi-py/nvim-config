return {
  "ibhagwan/fzf-lua",
  keys = {
    { "<leader>/", "<cmd>FzfLua live_grep<cr>" },
    { "<leader>,", "<cmd>FzfLua buffers sort_lastused=true<cr>" },
    { "<leader>ff", "<cmd>FzfLua files<cr>" },
    { "<leader>fr", "<cmd>FzfLua oldfiles cwd_only=true<cr>" },
    { "<leader>fg", "<cmd>FzfLua git_files<cr>" },
    { "<leader>gc", "<cmd>FzfLua git_commits<cr>" },
    { "<leader>gC", "<cmd>FzfLua git_bcommits<cr>" },
    { "<leader>gs", "<cmd>FzfLua git_status<cr>" },
    { "<leader>gb", "<cmd>FzfLua git_branches<cr>" },
  },
  cmd = "FzfLua",
  opts = {
    fzf_colors = true,
    fzf_opts = {
      ["--cycle"] = true,
      ["--no-scrollbar"] = true,
    },
    defaults = {
      formatter = "path.dirname_first",
      header = false,
    },
    keymap = {
      builtin = {
        ["<c-u>"] = "preview-page-up",
        ["<c-d>"] = "preview-page-down",
      },
    },
    winopts = {
      preview = {
        scrollbar = false,
      },
    },
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("fzf-lua").register_ui_select()
      vim.ui.select(...)
    end
  end,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
}
