local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<C-k>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })
