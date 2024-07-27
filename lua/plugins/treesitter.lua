return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = "User FilePost",
  opts = {
    ensure_install = {
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
      "python",
      "query",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "yaml",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        local success = pcall(vim.treesitter.start)
        if not success then
          return
        end

        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end,
    })
  end,
}
