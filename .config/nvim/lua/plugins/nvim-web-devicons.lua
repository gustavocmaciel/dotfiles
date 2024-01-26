return {
  "nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup {
      override_by_filename = {
        ["compose.yml"] = {
          icon = "󰡨",
          color = "#ff396e",
          name = "Compose"
        }
       };
      override_by_extension = {
        ["go"] = {
          icon = "󰟓",
          color = "#3f91cf",
          name = "Go"
        },
      };
    }
  end
}
