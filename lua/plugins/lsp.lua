local config = require "config"
local icons = require "config.icons"

return {
  {
    "neovim/nvim-lspconfig",
    event = { "LazyFile" },
    opts = {
      setup = {},
      servers = {},
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
    },
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local function map(mode, lhs, rhs, map_opts)
            map_opts = map_opts or {}
            map_opts.buffer = ev.buf
            map_opts.silent = true
            vim.keymap.set(mode, lhs, rhs, map_opts)
          end

          map("n", "E", vim.diagnostic.open_float)
          map("n", "[d", vim.diagnostic.goto_prev)
          map("n", "]d", vim.diagnostic.goto_next)

          map("n", "gD", vim.lsp.buf.declaration)
          map("n", "gd", vim.lsp.buf.definition)
          map("n", "gi", vim.lsp.buf.implementation)
          map("n", "gr", vim.lsp.buf.references)
          map("n", "<c-k>", vim.lsp.buf.signature_help)
          map("n", "K", vim.lsp.buf.hover)
          map("n", "<leader>D", vim.lsp.buf.type_definition)
          map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
          map("n", "<leader>rn", function()
            return ":IncRename " .. vim.fn.expand "<cword>"
          end, { expr = true })
        end,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.supports_method "textDocument/inlayHint" then
            vim.lsp.inlay_hint.enable(ev.buf, true)
          end
        end,
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = icons.border,
        silent = true,
      })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, {
          border = icons.border,
        })

      local capabilities = vim.tbl_deep_extend(
        "force",
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities(),
        opts.capabilities
      )

      local function setup_server(name)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = capabilities,
          flags = {
            debounce_text_changes = config.text_debounce,
          },
        }, opts.servers[name] or {})

        if opts.setup[name] and opts.setup[name](server_opts) then
          return
        end

        require("lspconfig")[name].setup(server_opts)
      end

      require("mason-lspconfig").setup {
        handlers = { setup_server },
      }

      vim.diagnostic.config {
        signs = false,
        float = {
          source = "always",
          border = icons.border,
          header = false,
        },
      }

      for name, icon in pairs(icons.diagnostics) do
        name = "DiagnosticSign" .. name:sub(1, 1):upper() .. name:sub(2)
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      vim.lsp.set_log_level(vim.log.levels.INFO)
    end,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
  },

  {
    "folke/trouble.nvim",
    keys = {
      { "<leader>tt", ":TroubleToggle<cr>", desc = "Troggle trouble" },
    },
    cmd = { "TroubleToggle" },
    opts = {
      height = 15,
      use_diagnostic_signs = true,
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },

  {
    "smjonas/inc-rename.nvim",
    event = { "CmdlineEnter" },
    opts = {},
  },

  {
    "kosayoda/nvim-lightbulb",
    event = { "LspAttach" },
    opts = {
      sign = {
        enabled = false,
      },
      virtual_text = {
        enabled = true,
        hl = "CursorLine",
      },
      autocmd = {
        enabled = true,
      },
    },
  },
}
