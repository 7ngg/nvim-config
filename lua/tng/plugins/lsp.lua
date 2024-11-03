return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "folke/neodev.nvim", opts = {} },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("neodev").setup({})

        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            require("cmp_nvim_lsp").default_capabilities())

        local _border = "rounded"

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "clangd",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
                end,

                ["csharp_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.csharp_ls.setup({
                        capabilities = capabilities,
                    })
                    require("luasnip.loaders.from_vscode").lazy_load()
                end,
            }
        })

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
                border = 'rounded',
                source = true,
                header = '',
                prefix = '',
            },
        })
    end
}
