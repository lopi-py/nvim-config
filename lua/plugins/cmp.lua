local icons = require "config.icons"

return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter" },
    config = function()
      local cmp = require "cmp"

      cmp.setup {
        mapping = {
          ["<c-n>"] = cmp.mapping.select_next_item(),
          ["<c-p>"] = cmp.mapping.select_prev_item(),
          ["<c-b>"] = cmp.mapping.scroll_docs(-4),
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
    },
  },
}
