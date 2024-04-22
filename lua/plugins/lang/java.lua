local function jdtls_config_dir(project_name)
  return string.format("%s/jdtls/%s/config", vim.fn.stdpath "cache", project_name)
end

local function jdtls_workspace_dir(project_name)
  return string.format("%s/jdtls/%s/workspace", vim.fn.stdpath "cache", project_name)
end

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    opts = function()
      local project_name = vim.fs.basename(vim.uv.cwd())
      local capabilities = require("lsp").capabilities

      return {
        capabilities = capabilities(),
        cmd = {
          "jdtls",
          "-configuration",
          jdtls_config_dir(project_name),
          "-data",
          jdtls_workspace_dir(project_name),
        },
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "java",
        callback = function()
          require("jdtls").start_or_attach(opts)
        end,
      })
    end,
  },
}
