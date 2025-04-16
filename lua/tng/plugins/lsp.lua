return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nanotee/sqls.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local ensure_installed = {
      "lua_ls",
      "clangd",
      "gopls",
    }

    local servers = {
      clangd = true,
      gopls = true,
      html = true,
      ts_ls = true,
      tailwindcss = true,
      jsonls = true,
      yamlls = true,
      cssls = true,
      zls = true,
      sqls = {
        on_attach = function(client, bufnr)
          require("sqls").on_attach(client, bufnr)
        end,
        settings = {
          sqls = {
            connections = {
              {
                driver = "postgresql",
                dataSourceName = "host=127.0.0.1 port=5432 user=postgres password=admin dbname=chirpy sslmode=disable"
              }
            }
          }
        }
      },
      omnisharp = {
        settings = {
          RoslynExtensionsOptions = {
            EnableImportCompletion = true
          }
        }
      },
      lua_ls = {
        Lua = {
          diagnostics = {
            globals = { "vim", "it", "describe", "before_each", "after_each" },
          }
        }
      },
    }

    local _border = "rounded"
    local capabilities = require("blink-cmp").get_lsp_capabilities()

    require("neodev").setup()
    require('mason').setup({
      registries = {
        'github:mason-org/mason-registry',
        'github:crashdummyy/mason-registry',
      },
    })

    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
    })

    for name, config in pairs(servers) do
      if config == true then
        config = {}
      end

      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities
      }, config)

      lspconfig[name].setup(config)
    end

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = _border,
      }
    )
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
      vim.lsp.handlers.signatureHelp, {
        border = _border,
      }
    )

    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      float = {
        style = 'minimal',
        border = _border,
        source = true,
        header = '',
        prefix = '',
      },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
      end
    })
  end
}
