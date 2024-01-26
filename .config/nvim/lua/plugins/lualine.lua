return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  config = function()
    require('lualine').setup({
      options = {
        theme = "catppuccin",
        disabled_filetypes = {
          statusline = {'neo-tree'},
          winbar = {'neo-tree'},
        },
        component_separators = ' ',
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {'filename'},
        lualine_x = {'encoding', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'},
      },
    })
  end
}
