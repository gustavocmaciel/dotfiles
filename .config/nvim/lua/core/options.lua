local opt = vim.opt

local options = {

  -- General
  mouse = "a",  -- enable mouse support in all modes
  fillchars = { eob = " " },
  clipboard = "unnamedplus",
  laststatus = 3, -- global statusline
  splitbelow = true, -- put new windows below
  splitright = true, -- put new windows right
  confirm = true,  -- promt to save the contents before exiting
  spelllang = { "en" },
  shell = "zsh",
  scrolloff = 8,
  autoread = true,
  showmode = false,
  --colorcolumn = "80",

  -- Indenting
  expandtab = true,
  shiftwidth = 4,
  smartindent = true,
  tabstop = 4,
  softtabstop = 4,

  -- Make search more convenient
  ignorecase = true,
  smartcase = true,
  incsearch = true,
  hlsearch = false,

  -- Numbers
  nu = true,
  numberwidth = 4,
  ruler = false,
  relativenumber = true,
  cursorline = true,

  -- Files
  backup = false,
  writebackup = false,
  swapfile = false,
}

for k, v in pairs(options) do
  opt[k] = v
end
