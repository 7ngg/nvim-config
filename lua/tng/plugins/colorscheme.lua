function ColorMyPencil(color)
  color = color or "vscode"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,
    config = function()
      require("vscode").setup({
        transparent = true
      })

      vim.cmd.colorscheme("vscode")
    end
  },
  "rose-pine/neovim",
  "folke/tokyonight.nvim",
}
