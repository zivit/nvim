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
require "plugins"

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
map('n', '<Space>ft', '<Cmd>TodoTelescope<CR>', opts)

map('n', '<Space>gl', '<Cmd>LazyGit<CR>', opts)

map('n', '<Space>tt', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<Space>tf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<Space>tb', '<Cmd>ToggleTerm direction=tab<CR>', opts)
map('n', '<Space>tr', '<Cmd>TroubleToggle<CR>', opts)

map('n', '[d', '<Cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<Cmd>lua vim.diagnostic.goto_next()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  map('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
  map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
  map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
  map('n', '<space>lwa', '<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', bufopts)
  map('n', '<space>lwr', '<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', bufopts)
  map('n', '<space>lwl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
end

map('v', '<Space>lcf', '<Esc><Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
map('n', '<Space>lca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Space>lci', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<Space>lsf', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<Space>lsl', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

map('n', '<F2>', '<Cmd>lua require("renamer").rename()<CR>', opts)
map('n', '<F3>', '<Cmd>Telescope lsp_references<CR>', opts)
map('n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

-- Setup
--local keybinds = require('lsp_config.keybinds')
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  
}
require('lspconfig').clangd.setup {
    --on_attach = keybinds.on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "--compile-commands-dir=build/.cmake",
        "--background-index",
        "--suggest-missing-includes",
        "--inlay-hints",
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
}

-- luasnip setup
local luasnip = require 'luasnip'

-- nvim-cmp setup
local cmp = require 'cmp'
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
  virtual_text = {
    prefix = '●', -- Could be '●', '▎', 'x'
  }
})

vim.cmd [[
  highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
  highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
  highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
  highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
}

require("cmp").setup({
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      col_offset = -3,
      side_padding = 0,
    },
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      --kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
})

-- Themes
require("onedark").setup {
    code_style = {
        comments = 'none'
    }
}
vim.cmd("colorscheme onedark")
-- vim.cmd("colorscheme ayu-mirage")
-- require('ayu').colorscheme()

