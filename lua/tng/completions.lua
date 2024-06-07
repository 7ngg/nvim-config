local lspkind = require("lspkind")
local cmp = require("cmp")

lspkind.init({})

cmp.setup({
    completion = {
        completeopt = 'menu, menuone',
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
    },
    {
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-n>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
        ["<C-p>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
        ['<C-.>'] = cmp.mapping.complete(),
        ['<Tab>'] = cmp.mapping(
            cmp.mapping.confirm {
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            },
            { "i", "c" }
        ),
        -- ['<C-e>'] = cmp.mapping.abort(),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
end, { silent = true })
