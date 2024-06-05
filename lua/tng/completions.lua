vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.shortmess:append("c")

local lspkind = require("lspkind")
local cmp = require("cmp")

lspkind.init({})

cmp.setup({
    preselect = "item",
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }, {
        { name = 'buffer' },
    }),
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

vim.keymap.set({ "i", "s" }, "<c-k>", function()
    return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
    return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
end, { silent = true })
