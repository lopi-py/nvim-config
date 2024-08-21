return {
  "nvim-pack/nvim-spectre",
  keys = {
    { "<leader>S", "<cmd>lua require('spectre').toggle()<cr>" },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "spectre_panel",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
      end,
    })
  end,
}
