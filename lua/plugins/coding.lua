local icons = require "config.icons"
local util = require "util"

return {
  {
    "garymjr/nvim-snippets",
    event = { "InsertEnter" },
    opts = {
      friendly_snippets = true,
      search_paths = {
        util.path_join(vim.fn.stdpath "config" --[[@as string]], "snippets"),
      },
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require "cmp"

      cmp.setup {
        mapping = {
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            elseif vim.snippet.jumpable(1) then
              vim.snippet.jump(1)
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
            elseif vim.snippet.jumpable(-1) then
              vim.snippet.jump(-1)
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<cr>"] = {
            i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
            c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
          },
          ["<c-u>"] = cmp.mapping.scroll_docs(-5),
          ["<c-d>"] = cmp.mapping.scroll_docs(5),
          ["<c-o>"] = {
            i = cmp.mapping.complete(),
            c = cmp.mapping.complete(),
          },
          ["<c-c>"] = {
            i = cmp.mapping.close(),
            c = cmp.mapping.close(),
          },
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "snippets" },
          { name = "buffer" },
        },
        formatting = {
          format = function(_, item)
            if icons.kind[item.kind] then
              item.kind = icons.kind[item.kind] .. item.kind
            end
            return item
          end,
        },
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      }

      cmp.setup.cmdline(":", {
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        sources = {
          { name = "buffer" },
        },
      })
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
  },

  {
    "echasnovski/mini.pairs",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
      modes = { command = true },
    },
  },

  {
    "kylechui/nvim-surround",
    event = { "LazyFile" },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = { "LazyFile" },
    opts = {
      ignore = "^$",
      pre_hook = function(ctx)
        return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
      end,
    },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    opts = {
      enable_autocmd = false,
    },
  },

  {
    "max397574/better-escape.nvim",
    event = { "InsertEnter" },
    opts = {
      mapping = { "jj", "jk" },
    },
  },
}
