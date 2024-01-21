return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets"
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "clangd",
                "rust_analyzer",
                "lua_ls"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = require('cmp_nvim_lsp').default_capabilities(),
                    })
                end,

                ["lua_ls"] = function ()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        settings = {
                            Lua = {
                                diagnostics = {
                                    globals = { "vim" }
                                }
                            }
                        }
                    }
                end,
            }
        })

        vim.diagnostic.config({
            virtual_text = true,
            update_in_insert = true,
            float = {
                style = 'minimal',
                border = 'rounded',
                source = 'always',
                header = '',
                prefix = '',
            },
        })

        require('luasnip.loaders.from_vscode').lazy_load()
        vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
        local cmp = require('cmp')
        cmp.setup({
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            window = {
                documentation = cmp.config.window.bordered(),
            },
            sources = {
                {name = 'luasnip'},
                {name = 'nvim_lsp'},
                {name = 'buffer'},
                {name = 'path'},
                {name = 'nvim_lua'},
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-.>'] = cmp.mapping.complete(),
                ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                -- ['<C-e>'] = cmp.mapping.abort(),
            }),
        })
    end
}
