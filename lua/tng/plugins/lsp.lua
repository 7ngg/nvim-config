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
    local servers = require("tng.servers")
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local ensure_installed = {
      "lua_ls",
      "clangd",
      "gopls",
    }

    require("neodev").setup()
    require('mason').setup({
      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    })

    ---@diagnostic disable-next-line: missing-fields
    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
    })

    for name, config in pairs(servers) do
      config = vim.tbl_deep_extend("force", {}, {
        capabilities = capabilities
      }, config)

      lspconfig[name].setup(config)
    end

    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = true,
      float = {
        style = 'minimal',
        border = "rounded",
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
