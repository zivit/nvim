-- Main settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true

-- Plugins settings
vim.cmd("colorscheme onedarkpro")

-- Keymap
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<Space>bc', '<Cmd>BufferClose<CR>', opts)
map('n', '<Space>bp', '<Cmd>BufferPin<CR>', opts)
map('n', '<Space>bk', '<Cmd>BufferPick<CR>', opts)

map('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>', opts)

map('n', '<Space>ff', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Space>fg', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<Space>fb', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<Space>fh', '<Cmd>Telescope help_tags<CR>', opts)

map('n', '<Space>gl', '<Cmd>LazyGit<CR>', opts)

map('n', '<Space>tt', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<Space>tf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<Space>tb', '<Cmd>ToggleTerm direction=tab<CR>', opts)
