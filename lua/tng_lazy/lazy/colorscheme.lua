function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
    {
        "Mofiqul/vscode.nvim",
        config = function ()
            vim.cmd.colorscheme("vscode")
        end
    }
--[[
    {
        "christianchiarulli/nvcode-color-schemes.vim",
        config = function ()
            vim.cmd("colorscheme nvcode")
        end
    },
]]

--[[
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require('rose-pine').setup({
                disable_background = true,
            })

            ColorMyPencils()
        end
    },
--]]
}
