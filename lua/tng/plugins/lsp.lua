return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- "saghen/blink.cmp",
    { "folke/neodev.nvim", opts = {} },
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    local lspconfig = require("lspconfig")

    local ensure_installed = {
      "lua_ls",
      "clangd",
      "gopls",
    }

    local servers = {
      dockerls = true,
      clangd = true,
      gopls = true,
      html = true,
      pyright = true,
      ts_ls = true,
      tailwindcss = true,
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
  end
}
