return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require('conform')

        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                typescript = { { "prettierd", "prettier" } },
                typescriptreact = { { "prettierd", "prettier" } },
                javascript = { { "prettierd", "prettier" } },
                javascriptreact = { { "prettierd", "prettier" } },
            }
        })

        vim.keymap.set('n', '<leader>f', function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end)
    end
}
