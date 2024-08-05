local function jdtls_config_dir(project_name)
  return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/config"
end

local function jdtls_data_dir(project_name)
  return vim.fn.stdpath "cache" .. "/jdtls/" .. project_name .. "/data"
end

local function glob(path)
  return vim.split(vim.fn.glob(path), "\n")
end

return {
  "mfussenegger/nvim-jdtls",
  event = "User FilePost",
  opts = function()
    local registry = require "mason-registry"

    local java_dbg_path = registry.get_package("java-debug-adapter"):get_install_path()
    local java_test_path = registry.get_package("java-test"):get_install_path()

    local bundles = {}

    -- stylua: ignore start
    vim.list_extend(bundles, glob(java_dbg_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"))
    vim.list_extend(bundles, glob(java_test_path .. "/extension/server/*.jar"))
    -- stylua: ignore end

    return {
      capabilities = require("lsp").capabilities(),
      cmd = {
        "jdtls",
        "-configuration",
        jdtls_config_dir(vim.fs.basename(vim.uv.cwd())),
        "-data",
        jdtls_data_dir(vim.fs.basename(vim.uv.cwd())),
      },
      init_options = {
        bundles = bundles,
      },
      on_attach = function()
        require("jdtls").setup_dap { hotcodereplace = "auto", config_overrides = {} }
        require("jdtls.dap").setup_dap_main_class_configs()
      end,
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
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
}
