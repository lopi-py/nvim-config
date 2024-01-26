return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>S", ":lua require('spectre').toggle()<cr>" },
    { "<leader>sw", ":lua require('spectre').open_visual { select_word = true }<cr>" },
    { "<leader>sw", ":lua require('spectre').open_visual()<cr>", mode = "v" },
    { "<leader>sp", ":lua require('spectre').open_file_search { select_word = true }<cr>" },
    { "<leader>sp", ":lua require('spectre').open_file_search()<cr>", mode = "v" },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "spectre_panel",
      callback = function()
        vim.opt_local.statuscolumn = ""
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })
  end,
}
