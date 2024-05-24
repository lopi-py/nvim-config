local icons = require "config.icons"

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    opts = function()
      local cmp = require "cmp"

      return {
        mapping = {
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<c-d>"] = cmp.mapping.scroll_docs(-4),
          ["<c-f>"] = cmp.mapping.scroll_docs(4),
          ["<c-y>"] = cmp.mapping.confirm { select = true },
          ["<c-e>"] = cmp.mapping.abort(),
          ["<c-space>"] = cmp.mapping.complete(),

          ["<c-l>"] = cmp.mapping(function()
            if vim.snippet.active { direction = 1 } then
              vim.snippet.jump(1)
            end
          end, { "i", "s" }),

          ["<c-h>"] = cmp.mapping(function()
            if vim.snippet.active { direction = -1 } then
              vim.snippet.jump(-1)
            end
          end, { "i", "s" }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer", keyword_length = 5 },
          { name = "snippets" },
        },
        formatting = {
          format = function(_, item)
            if icons.kind[item.kind] then
              item.kind = icons.kind[item.kind] .. item.kind
            end

            return item
          end,
        },
      }
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",

      {
        "garymjr/nvim-snippets",
        opts = {
          friendly_snippets = true,
        },
        dependencies = {
          "rafamadriz/friendly-snippets",
        },
      },
    },
  },
}
