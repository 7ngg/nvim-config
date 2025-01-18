function ColorMyPencil(color)
  color = color or "vscode"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    config = function()
      require("vscode").setup({
        transparent = true,
        italic_comments = false
      })

      -- ColorMyPencil()
    end
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        style = "night",
        transparent = true
      })

      ColorMyPencil("tokyonight")
    end
  }
}
