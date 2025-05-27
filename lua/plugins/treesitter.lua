return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  opts = {
    ensure_install = {
      "asm",
      "blade",
      "c",
      "cpp",
      "css",
      "html",
      "java",
      "javascript",
      "json",
      "json5",
      "jsonc",
      "lua",
      "luau",
      "markdown",
      "markdown_inline",
      "php",
      "php_only",
      "python",
      "query",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
    vim_regex = { "php" },
  },
  config = function(_, opts)
    vim.api.nvim_create_user_command("TSInstallAll", function()
      require("nvim-treesitter").install(opts.ensure_install)
    end, {})

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local ok = pcall(vim.treesitter.start)
        if not ok then
          return
        end

        -- NOTE: not needed if indent actually worked for these languages without vim regex
        -- or if treesitter indent was used
        if vim.tbl_contains(opts.vim_regex, vim.bo.filetype) then
          vim.bo.syntax = "on"
        end

        -- NOTE: indent forces a re-parse, which negates the benefit of async parsing
        -- see https://github.com/nvim-treesitter/nvim-treesitter/issues/7840
        -- vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end,
    })
  end,
}
