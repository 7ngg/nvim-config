return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',

  version = 'v0.*',

  opts = {
    keymap = {
      preset = 'none',
      ['<Tab>'] = { "accept", "fallback" },
      ['<c-n>'] = { "select_next", "fallback" },
      ['<c-p>'] = { "select_prev", "fallback" },
      ['<c-k>'] = { "snippet_forward", "fallback" },
      ['<c-j>'] = { "snippet_backward", "fallback" },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },

    signature = { enabled = true },

    completion = {
      documentation = {
        auto_show = true,
        window = {
          border = "rounded"
        }
      },
      menu = {
        border = "padded",
        draw = {
          treesitter = { "lsp" }
        },
      }
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    }
  },
}
