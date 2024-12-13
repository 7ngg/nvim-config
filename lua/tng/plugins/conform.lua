return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        local conform = require('conform')

        require('conform').setup({
            formatters_by_ft = {
                lua = { 'stylua' },
                typescript = { "prettierd", "prettier", stop_after_first = true },
                typescriptreact = { "prettierd", "prettier", stop_after_first = true },
                javascript = { "prettierd", "prettier", stop_after_first = true },
                javascriptreact = { "prettierd", "prettier", stop_after_first = true },
                csharp = { "prettierd" , "csharpier", stop_after_first = true }
            }
        })

        vim.keymap.set('n', '<leader>f', function()
            conform.format({
                lsp_fallback = true,
                async = false,
                -- timeout_ms = 500,
            })
        end)
    end
}
