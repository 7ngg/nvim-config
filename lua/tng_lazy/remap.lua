--vim.o.guicursor = ""
vim.o.guicursor = 'n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor'

vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Cursor always centered when jumpimg half page up/down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- 
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Moving lines up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Replace all enties
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- SassAutocompile
vim.keymap.set("n", "<leader>sp", function ()
    local current_buffer = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(current_buffer)
    local new_filename = filename:gsub("%.scss$", ".min.css")
    local command = string.format("sass --no-source-map %s %s --style compressed", filename, new_filename)

    local ok, err = os.execute(command)

    if ok then
        print(string.format("Compiled into %s", new_filename))
    else
        print(string.format("Error compiling %s", filename))
    end
end)

-- Buffer format
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
