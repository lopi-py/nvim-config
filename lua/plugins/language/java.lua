local function jdtls_config_dir(project_name)
  return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/config"
end

local function jdtls_workspace_dir(project_name)
  return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/workspace"
end

return {
  "mfussenegger/nvim-jdtls",
  ft = "java",
  opts = function()
    local capabilities = require("lsp").capabilities()

    return {
      capabilities = capabilities,
      cmd = {
        vim.fn.exepath "jdtls",
        "-configuration",
        jdtls_config_dir(vim.fs.basename(vim.uv.cwd())),
        "-data",
        jdtls_workspace_dir(vim.fs.basename(vim.uv.cwd())),
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
}
