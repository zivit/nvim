-- Main settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = 'a'
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.expandtab = true
vim.o.colorcolumn = 100
vim.o.wrap = true

vim.cmd[[
    colorscheme onedark

    if exists("g:neovide")
        let g:neovide_remember_window_size=1
        let g:neovide_input_macos_alt_is_meta=0
        let g:neovide_refresh_rate=60
        " let g:neovide_fullscreen=1
        set guifont=FuraCode\ Nerd\ Font:h11
    endif
]]

require "plugins"
require "setup.init"
require "themes.init"
require "shortcuts.keymap"

