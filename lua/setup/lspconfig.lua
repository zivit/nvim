-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
}

local lspconfig = require "lspconfig"
local navic = require("nvim-navic")

local on_attach = function(client, bufnr)
    navic.attach(client, bufnr)

    local map = vim.api.nvim_set_keymap
    local opts = { noremap = true, silent = true }

    map('n', '<Space>o', '<Cmd>Lspsaga outline<CR>', opts)
    map('n', '<Space>zd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
    map('n', '<Space>zd', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
    map('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
    map('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
    map('n', '[e', '<Cmd>lua require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>', opts)
    map('n', ']e', '<Cmd>lua require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>', opts)
    map('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
    map('n', 'ge', '<Cmd>Lspsaga peek_definition<CR>', opts)
    map('n', 'gf', '<Cmd>Lspsaga goto_definition<CR>', opts)
    map('n', 'gr', '<Cmd>Lspsaga finder<CR>', opts)
    map('n', 'gt', '<Cmd>Lspsaga term_toggle<CR>', opts)
    map('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

    map('n', '<F3>', '<Cmd>Telescope lsp_references<CR>', opts)
    map('n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    map('n', 'gs', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
    map('n', 'gd', '<Cmd>Telescope lsp_references<CR>', opts)
    -- map('n', 'gf', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

    -- Visual mode
    map('v', '<Space>f', '<Esc><Cmd>lua vim.lsp.buf.format{range = {}}<CR>', opts)
end

-- local language_servers = require("lspconfig").util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
-- for _, ls in ipairs(language_servers) do
--     require('lspconfig')[ls].setup({
--         capabilities = capabilities,
--         on_attach = on_attach
--     })
-- end

-- The following example advertise capabilities to `clangd`.
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        -- "--compile-commands-dir=build/.cmake", --  NOTE: Using .clangd file instead of
        "--background-index",
        "--suggest-missing-includes",
        "--inlay-hints",
        "--clang-tidy",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
}

lspconfig.qmlls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "qmlls6",
        -- "--build-dir "..vim.fn.getcwd(),
    },
    filetypes = { "qml", "qmljs" }
}

lspconfig.solargraph.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "solargraph", "stdio" },
    filetypes = { "ruby" },
    init_options = {
        formatting = true
    },
    settings = {
        solargraph = {
            diagnostics = true
        }
    }
}

lspconfig.asm_lsp.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.bashls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.cmake.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.cssls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.cssmodules_ls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.html.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.jsonls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.lua_ls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.pylsp.setup { on_attach = on_attach, capabilities = capabilities, }
-- lspconfig.ruby_rls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.rust_analyzer.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.slint_lsp.setup { on_attach = on_attach, capabilities = capabilities, }
-- lspconfig.ts_ls.setup { on_attach = on_attach, capabilities = capabilities, }
lspconfig.vuels.setup { on_attach = on_attach, capabilities = capabilities, }
--
