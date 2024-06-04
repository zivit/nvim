local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Main settings
vim.o.clipboard = "unnamedplus"
vim.o.colorcolumn = '100'
vim.o.cursorline = true
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
vim.opt.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\\;,є',ґ\\,яz,чx,сc,мv,иb,тn,ьm,ю.,./,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Є\\\",Ґ|,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,№#"

vim.g.startup_bookmarks = {
    ["A"] = '~/work/git/MON700-app',
    ["F"] = '~/work/git/MON700-FileSystem',
    ["N"] = '~/.config/nvim',
    ["U"] = '~/work/git/uniport_com',
    ["M"] = '~/work/git/MON700-modules',
}

local signs = { Error = "", Warn = "", Hint = "󰌵", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '' -- Could be '●', '▎', 'x'
    }
})

require("lazy").setup("plugins")
require "setup"
require "themes"
require "shortcuts.keymap"

vim.cmd[[
    colorscheme onedark

    if exists("g:neovide")
        " let g:neovide_background_color = '#BF4040'
        let g:neovide_remember_window_size=1
        let g:neovide_input_macos_alt_is_meta=0
        let g:neovide_refresh_rate=60
        let g:neovide_refresh_rate_idle=5
        let g:neovide_cursor_vfx_mode = "railgun"
        set guifont=FiraCode\ Nerd\ Font\ Mono:h10
    endif
]]
