local lspkind = require("lspkind")
local cmp = require("cmp")

lspkind.init({})

local mapping = {
  ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "c", "i" }),
  ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "c", "i" }),
  ["<Tab>"] = cmp.mapping(cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  }, { "c", "i" }),
  ["<C-.>"] = cmp.mapping.complete({}),
  -- -- ['<C-e>'] = cmp.mapping.abort(),
}

cmp.setup({
  completion = {
    completeopt = "menu,menuone,popup"
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  mapping = cmp.mapping.preset.insert(mapping),
  snippet = {
    expand = function(args)
      require("luasnip.loaders.from_vscode").lazy_load()
      vim.snippet.expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  }),
  ---@diagnostic disable-next-line: missing-fields
  matching = { disallow_symbol_nonprefix_matching = false }
})
