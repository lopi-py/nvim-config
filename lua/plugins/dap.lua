return {
  {
    "mfussenegger/nvim-dap",
    keys = {
      { "<leader>dc", ":lua require('dap').continue()<cr>" },
      { "<leader>dj", ":lua require('dap').step_over()<cr>" },
      { "<leader>di", ":lua require('dap').step_into()<cr>" },
      { "<leader>do", ":lua require('dap').step_out()<cr>" },
      { "<leader>dl", ":lua require('dap').run_last()<cr>" },
      { "<leader>da", ":lua require('dap').list_breakpoints(true)<cr>" },
      { "<leader>dq", ":lua require('dap').terminate()<cr>" },
      { "<leader>dx", ":lua require('dap').clear_breakpoints()<cr>" },
      { "<leader>db", ":lua require('dap').toggle_breakpoint()<cr>" },
      {
        "<leader>dB",
        function()
          vim.ui.input({ prompt = "Breakpoint condition" }, function(condition)
            if condition then
              require("dap").set_breakpoint(condition)
            end
          end)
        end,
      },
    },
    config = function()
      local signs = {
        Breakpoint = { "", "DiagnosticError" },
        BreakpointCondition = { "", "DiagnosticError" },
        BreakpointRejected = { "", "DiagnosticError" },
        Stopped = { "", "DiagnosticInfo" },
        LogPoint = { "⁋" },
      }

      for name, sign in pairs(signs) do
        vim.fn.sign_define("Dap" .. name, { text = sign[1], texthl = sign[2] })
      end
    end,
    dependencies = {
      "rcarriga/nvim-dap-ui",

      {
        "theHamsta/nvim-dap-virtual-text",
        opts = {},
      },
    },
  },

  {
    "rcarriga/nvim-dap-ui",
    keys = {
      { "<leader>du", ":lua require('dapui').toggle { reset = true }<cr>" },
      { "<leader>de", ":lua require('dapui').eval()<cr>" },
    },
    opts = {},
    config = function(_, opts)
      local dap = require "dap"
      local dapui = require "dapui"

      dapui.setup(opts)

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
    end,
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
  },
}
