return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>pf', builtin.find_files)
    vim.keymap.set('n', '<leader>ph', builtin.help_tags)
    vim.keymap.set('n', '<leader>pg', builtin.git_files)
    vim.keymap.set('n', '<leader>ps', builtin.live_grep)
    vim.keymap.set('n', '<leader>sn', function()
      builtin.find_files({ cwd = vim.fn.stdpath('config') })
    end)
  end
}
