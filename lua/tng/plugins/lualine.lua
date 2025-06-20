return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local theme = require('lualine.themes.ayu_dark')
    require('lualine').setup({
      options = {
        theme = theme,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
      }
    })
  end
}
