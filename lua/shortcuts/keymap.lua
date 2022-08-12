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

map('n', '<Space>ff', '<Cmd>Telescope find_files find_command=rg,--hidden,--files prompt_prefix=🔍<CR>', opts)
map('n', '<Space>fg', '<Cmd>Telescope live_grep find_command=rg,--hidden,--files prompt_prefix=🔍<CR>', opts)
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

map('v', '<Space>f', '<Esc><Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)

map('n', '<Space>lca', '<Cmd>lua vim.lsp.buf.code_action()<CR>', opts)
map('n', '<Space>lci', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', '<Space>ldi', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<Space>ldl', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

map('n', '<F2>', '<Cmd>lua require("renamer").rename()<CR>', opts)
map('n', '<F3>', '<Cmd>Telescope lsp_references<CR>', opts)
map('n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
