return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  event = "VeryLazy",
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
    -- schedule highlight avoid delays when opening a typescript file because the parser is slow to startup
    vim.api.nvim_create_autocmd("FileType", {
      callback = vim.schedule_wrap(function(event)
        local has_parser = pcall(vim.treesitter.get_parser, event.buf)
        if not has_parser then
          return
        end

        vim.treesitter.start(event.buf)
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.b[event.buf].indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
      end),
    })
  end,
}
