vim.opt.colorcolumn = "100"

local dotnet = require("easy-dotnet")

vim.keymap.set("n", "<leader>dn", function()
    local path = vim.fn.input("Path: ")
	dotnet.createfile(path)
end)
