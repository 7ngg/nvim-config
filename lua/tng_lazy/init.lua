require("tng_lazy.remap")
require("tng_lazy.set")
require("tng_lazy.lazy_init")

local augroup = vim.api.nvim_create_augroup
local tngLazyGroup = augroup('tng_lazy', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = tngLazyGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

--vim.g.netrw_browse_split = 0
--vim.g.netrw_banner = 0
--vim.g.netrw_winsize = 25
