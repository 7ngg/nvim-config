return {
    {
--[[        'navarasu/onedark.nvim',
        config = function ()
            require('onedark').setup({
                style = 'darker'
            })
            require('onedark').load()
        end--]]
        'tomasiser/vim-code-dark',
        config = function ()
            vim.cmd('colorscheme codedark')
        end
    },
}
