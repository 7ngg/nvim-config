return {
    'theprimeagen/harpoon',
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set("n", "<leader>a", mark.add_file)
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

        for _, index in ipairs { 1, 2, 3, 4, 5 } do
            vim.keymap.set("n", string.format("<space>%d", index), function()
                ui.nav_file(index)
            end)
        end
    end
}
