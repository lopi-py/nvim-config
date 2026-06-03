return {
  "so1ve/tiny-treesitter.nvim",
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
      "zig",
    },
    allow_vim_regex = { "php" },
  },
  config = function(_, opts)
    local loaded = {}
    local pending = {}

    local ns = vim.api.nvim_create_namespace "treesitter.start"

    ---@param lang string
    local function start(lang)
      local ok = pcall(vim.treesitter.start, 0, lang)
      if not ok then
        return
      end

      -- NOTE: not needed if indent actually worked for these languages without
      -- vim regex or if treesitter indent was used
      if vim.tbl_contains(opts.allow_vim_regex, vim.bo.filetype) then
        vim.bo.syntax = "on"
      end

      vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"

      -- NOTE: indent forces a re-parse, which negates the benefit of async
      -- parsing, see https://github.com/nvim-treesitter/nvim-treesitter/issues/7840
      -- vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"

      loaded[lang] = true
    end

    -- NOTE: parsers may take long to parse queries so try to start them async
    -- in the next render if not loaded yet
    vim.api.nvim_set_decoration_provider(ns, {
      on_start = function()
        if not next(pending) then
          return false
        end

        vim.schedule(function()
          local queued = pending
          pending = {}

          for winnr, data in pairs(queued) do
            if vim.api.nvim_win_is_valid(winnr) then
              vim._with({ win = winnr, buf = data.bufnr }, function()
                start(data.lang)
              end)
            end
          end
        end)

        return false
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(event)
        local lang = vim.treesitter.language.get_lang(event.match)
        if not lang then
          return
        end

        if loaded[lang] then
          start(lang)
        else
          pending[vim.api.nvim_get_current_win()] = {
            lang = lang,
            bufnr = event.buf,
          }
        end
      end,
    })

    require("tiny-treesitter").setup {
      ensure_installed = opts.ensure_install,
    }
  end,
}
