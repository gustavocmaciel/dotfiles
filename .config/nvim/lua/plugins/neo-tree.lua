return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
     vim.fn.sign_define("DiagnosticSignError",
       {text = " ", texthl = "DiagnosticSignError"})
     vim.fn.sign_define("DiagnosticSignWarn",
       {text = " ", texthl = "DiagnosticSignWarn"})
     vim.fn.sign_define("DiagnosticSignInfo",
       {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
       {text = "󰌵", texthl = "DiagnosticSignHint"})
    require("neo-tree").setup({
      close_if_last_window = false,
      p_border_style = "rounded",
      enable_git_status = true,
      enable_diagnostics = true,
      window = {
        position = "left",
          width = 27,
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
  end
}
