return ({{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        require('nvim-treesitter.install').prefer_git = false
        --require('nvim-treesitter.install').compilers = { "clang" }

        require('nvim-treesitter.configs').setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
            
            sync_install = false,
            
            auto_install = true,
            
            indent = {
                enable = true
            },

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}})
