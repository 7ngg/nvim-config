function ColorMyPencils(color)
    color = color or "vscode"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
    {
        "Mofiqul/vscode.nvim",
    },
    {
        "sainnhe/sonokai",
        config = function()
            vim.g.sonokai_style = "shusia"
        end
    },
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup {
                style = "warmer",
                code_style = {
                    comments = 'none'
                }
            }
            require("onedark").load()
        end
    }
}
