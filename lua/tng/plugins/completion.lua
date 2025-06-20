return {
  "saghen/blink.cmp",
  dependencies = {
    "onsails/lspkind.nvim",
    "rafamadriz/friendly-snippets"
  },

  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config

  opts = {
    keymap = {
      preset = "none",
      ["<Tab>"] = { "accept", "fallback" },
      ["<c-n>"] = { "select_next", "fallback" },
      ["<c-p>"] = { "select_prev", "fallback" },
      ["<c-k>"] = { "snippet_forward", "fallback" },
      ["<c-j>"] = { "snippet_backward", "fallback" },
    },

    appearance = {
      nerd_font_variant = "mono",
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
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
              end,
            }
          }
        }
      }
    },

    fuzzy = { implementation = "prefer_rust_with_warning" },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
        ["easy-dotnet"] = {
          name = "easy-dotnet",
          enabled = true,
          module = "easy-dotnet.completion.blink",
          score_offset = 10000,
          async = true,
        },
      },
    },

    cmdline = {
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },
  },
}
