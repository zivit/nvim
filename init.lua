-- Main settings
vim.o.clipboard = "unnamedplus"
vim.o.expandtab = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.wrap = false
vim.o.undofile = true

vim.opt.colorcolumn = '100'

require "plugins"
require "setup"
require "themes"
require "shortcuts.keymap"

vim.cmd[[
    colorscheme onedark

    if exists("g:neovide")
        let g:neovide_remember_window_size=1
        let g:neovide_input_macos_alt_is_meta=0
        let g:neovide_refresh_rate=60
        set guifont=FuraCode\ Nerd\ Font:h10
    endif
]]
