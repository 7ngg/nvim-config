require("tng.remap")
require("tng.set")
require("tng.lazy")

local augroup = vim.api.nvim_create_augroup
local tngGroup = augroup('tng', {})

local autocmd = vim.api.nvim_create_autocmd

vim.cmd.filetype('on')

local lsp_attach = function(e)
  local opts = { buffer = e.buf }
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end

autocmd('LspAttach', {
  group = tngGroup,
  callback = lsp_attach
})

autocmd('TextYankPost', {
  group = tngGroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- autocmd('BufWritePre', {
--     callback = function(args)
--         require('conform').format({
--             bufnr = args.buf,
--             lsp_fallback = true,
--             quiet = true,
--         })
--     end
-- })

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_winsize = 25

