local icons = require "config.icons"

return {
  {
    "L3MON4D3/LuaSnip",
    keys = {
      { "<c-k>", "<plug>luasnip-prev-coice", mode = "i" },
      { "<c-j>", "<plug>luasnip-next-coice", mode = "i" },
    },
    opts = {
      update_events = "InsertLeave,TextChangedI",
      region_check_events = "CursorMoved,CursorMovedI",
    },
    config = vim.schedule_wrap(function(_, opts)
      require("luasnip").setup(opts)
      require("luasnip.loaders.from_vscode").lazy_load()
    end),
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
            local luasnip = require "luasnip"
            if cmp.visible() then
              cmp.select_next_item { behavior = cmp.SelectBehavior.Select }
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            local luasnip = require "luasnip"
            if cmp.visible() then
              cmp.select_prev_item { behavior = cmp.SelectBehavior.Select }
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s", "c" }),
          ["<cr>"] = {
            i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true },
            c = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
          },
          ["<c-b>"] = cmp.mapping.scroll_docs(-5),
          ["<c-f>"] = cmp.mapping.scroll_docs(5),
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
          { name = "luasnip" },
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
            require("luasnip").lsp_expand(args.body)
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
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
    },
  },

  {
    "windwp/nvim-autopairs",
    event = { "InsertEnter" },
    opts = {},
    config = function(_, opts)
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      local cmp = require "cmp"

      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      require("nvim-autopairs").setup(opts)
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
  },

  {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    opts = {},
  },

  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
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
