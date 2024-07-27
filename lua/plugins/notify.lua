return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss { silent = true, pending = true }
      end,
      desc = "Dismiss all notifications",
    },
  },
  opts = {
    background_colour = "#000000",
    stages = "slide",
  },
  init = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.notify = function(...)
      return require("notify").notify(...)
    end
  end,
}
