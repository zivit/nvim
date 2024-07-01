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
vim.o.wrap = true
-- vim.opt.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ї],фa,іs,вd,аf,пg,рh,оj,лk,дl,ж\\;,є',ґ\\,яz,чx,сc,мv,иb,тn,ьm,ю.,./,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ї},ФA,ІS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Є\\\",Ґ|,ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,№#"

if vim.g.neovide then
    vim.g.neovide_remember_window_size = 1
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_cursor_vfx_mode = "railgun"
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 5

    vim.o.guifont = "FiraCode Nerd Font Mono:h12"
end

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
require "shortcuts.keymap"

vim.cmd("colorscheme onedark")

