local icons = require "config.icons"

return {
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
            i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Insert, select = true },
            c = cmp.mapping.confirm(),
          },
          ["<c-u>"] = cmp.mapping.scroll_docs(-5),
          ["<c-d>"] = cmp.mapping.scroll_docs(5),
          ["<c-space>"] = cmp.mapping.complete(),
          ["<c-e>"] = cmp.mapping(function()
            cmp.abort()
          end, { "i", "s", "c" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "snippets" },
          { name = "buffer", keyword_length = 5 },
        },
        formatting = {
          expandable_indicator = false,
          fields = { "abbr", "kind" },
          format = function(_, item)
            if icons.kind[item.kind] then
              item.kind = icons.kind[item.kind] .. item.kind
            end

            return item
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
}
