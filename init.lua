-- Main settings
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = '100'
vim.o.expandtab = true
vim.o.mouse = 'a'
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.smartindent = true
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.termguicolors = true
vim.o.undofile = true
vim.o.wrap = false

vim.g.startup_bookmarks = {
    ["A"] = '~/work/git/MON700-app',
    ["F"] = '~/work/git/MON700-FileSystem',
    ["N"] = '~/.config/nvim',
    ["U"] = '~/work/git/uniport_com',
    ["M"] = '~/work/git/MON700-modules',
}

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
        set guifont=FiraCode\ Nerd\ Font\ Mono:h10
    endif
]]
