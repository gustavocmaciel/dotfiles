return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup {
      no_italic = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        illuminate = true,
        mini = {
          enabled = true,
          indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        rainbow_delimiters = true,
        telescope = {
          enabled = true
        },
        treesitter = true,
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = "#a1aac5" },
          CursorLineNr = { fg = colors.mauve },
          LineNr = { fg = "#9197AE" },
        }
      end
    }
    vim.cmd.colorscheme "catppuccin"
  end
}
