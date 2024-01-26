return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.5',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.95 },
          preview_width = 0.5,
        },
      },
    })
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.command_history, {})
    vim.keymap.set('n', '<leader>fc', builtin.current_buffer_fuzzy_find, {})
    vim.keymap.set('n', '<leader>fs', builtin.grep_string, {})
  end
}
