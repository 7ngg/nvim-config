vim.opt_local.shiftwidth = 2

vim.keymap.set("n", "<leader>sp", function ()
    local current_buffer = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(current_buffer)
    local new_filename = filename:gsub("%.scss$", ".min.css")
    local command = string.format("sass --no-source-map %s %s --style compressed", filename, new_filename)

    local ok = os.execute(command)

    if ok == 0 then
        print(string.format("Compiled into %s", new_filename))
    else
        print(string.format("Error compiling %s", filename))
    end
end)
