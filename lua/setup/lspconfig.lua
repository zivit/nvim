-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local lspconfig = require "lspconfig"

-- The following example advertise capabilities to `clangd`.
lspconfig.clangd.setup {
    --on_attach = keybinds.on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        -- "--compile-commands-dir=build/.cmake", --  NOTE: Using .clangd file instead of
        "--background-index",
        "--suggest-missing-includes",
        "--inlay-hints",
        "--clang-tidy",
    },
    filetypes = {"c", "cpp", "objc", "objcpp"},
}

lspconfig.bashls.setup {}
lspconfig.cmake.setup { capabilities = capabilities, }
lspconfig.cssls.setup { capabilities = capabilities, }
lspconfig.cssmodules_ls.setup {}
lspconfig.html.setup { capabilities = capabilities, }
lspconfig.jsonls.setup { capabilities = capabilities, }
lspconfig.marksman.setup {}
lspconfig.pylsp.setup {}
lspconfig.rust_analyzer.setup { capabilities = capabilities, }
lspconfig.sumneko_lua.setup {}
lspconfig.tsserver.setup { capabilities = capabilities, }
lspconfig.vuels.setup { capabilities = capabilities, }
