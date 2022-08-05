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
map('n', '<Space>bp', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-1>',     '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>',     '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>',     '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>',     '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>',     '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>',     '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>',     '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>',     '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>',     '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>',     '<Cmd>BufferGoto 0<CR>', opts)
map('n', '<Space>b1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<Space>b2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<Space>b3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<Space>b4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<Space>b5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<Space>b6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<Space>b7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<Space>b8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<Space>b9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<Space>b0', '<Cmd>BufferLast<CR>', opts)

map('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>', opts)

map('n', '<Space>ff', '<Cmd>Telescope find_files<CR>', opts)
map('n', '<Space>fg', '<Cmd>Telescope live_grep<CR>', opts)
map('n', '<Space>fb', '<Cmd>Telescope buffers<CR>', opts)
map('n', '<Space>fh', '<Cmd>Telescope help_tags<CR>', opts)

map('n', '<Space>gl', '<Cmd>LazyGit<CR>', opts)

map('n', '<Space>tt', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<Space>tf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<Space>tb', '<Cmd>ToggleTerm direction=tab<CR>', opts)
map('n', '<Space>tr', '<Cmd>TroubleToggle<CR>', opts)

vim.keymap.set('n', '<space>lsf', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>lsl', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>lwa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>lwr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>ltd', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>lbr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>lca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>lcf', vim.lsp.buf.formatting, bufopts)
end

-- Setup
--local keybinds = require('lsp_config.keybinds')

require('lspconfig').clangd.setup {
    --on_attach = keybinds.on_attach,
    cmd = {
        "clangd",
        "--compile-commands-dir=build/.cmake",
        "--background-index",
        "--suggest-missing-includes",
        "-inlay-hints",
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
}
