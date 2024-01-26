local keymap = vim.keymap

opts = { noremap = true, silent = true }

-- General
keymap.set("n", "<leader>pv", vim.cmd.Ex)
keymap.set("n", "<leader>w", vim.cmd.w)  -- save file using <space>w
keymap.set("n", "<leader>bd", vim.cmd.bd)  -- close current buffer using <space>bd
keymap.set("n", "<leader>q", vim.cmd.q)  -- close current buffer using <space>q
keymap.set("n", "a", "A", opts)  -- switch A with a
keymap.set("n", ";", "A;<esc>", opts)
vim.keymap.set('n', '<C-a>', 'ggVG', opts)  -- select all the contents of the file
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set("n", "<leader><leader>", "<C-^>", opts)  -- <leader><leader> toggles between buffers

-- Jump to start and end of line using the home row keys
keymap.set("n", "L", "$", opts)
keymap.set("n", "H", "^", opts)

-- Move lines
keymap.set("n", "J", ":m .+1<CR>==", opts)
keymap.set("n", "K", ":m .-2<CR>==", opts)
keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Split navigations
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize windows
vim.keymap.set('n', '<C-w>K', ':resize +10<CR>', opts)
vim.keymap.set('n', '<C-w>K', ':resize +10<CR>', opts)
vim.keymap.set('n', '<C-w>J', ':resize -10<CR>', opts)
vim.keymap.set('n', '<C-w>L', ':vertical:resize -10<CR>', opts)
vim.keymap.set('n', '<C-w>H', ':vertical:resize +10<CR>', opts)
vim.keymap.set('n', '<C-w>J', ':resize -10<CR>', opts)
vim.keymap.set('n', '<C-w>L', ':vertical:resize -10<CR>', opts)
vim.keymap.set('n', '<C-w>H', ':vertical:resize +10<CR>', opts)

