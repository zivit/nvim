local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Normal mode
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)

map('n', '<F2>', '<Cmd>lua require("renamer").rename()<CR>', opts)
map('n', '<F3>', '<Cmd>Telescope lsp_references<CR>', opts)
map('n', '<F4>', '<Cmd>CMake configure<CR>', opts)
map('n', '<F5>', '<Cmd>CMake build_and_debug<CR>', opts)
map('n', '<C-F5>', '<Cmd>DapContinue<CR>', opts)
map('n', '<F8>', '<Cmd>DapToggleBreakpoint<CR>', opts)
map('n', '<F9>', '<Cmd>DapStepInto<CR>', opts)
map('n', '<F10>', '<Cmd>DapStepOut<CR>', opts)
map('n', '<F11>', '<Cmd>DapStepOver<CR>', opts)
map('n', '<F12>', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)

map('n', '<A-1>',     '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>',     '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>',     '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>',     '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>',     '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>',     '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>',     '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>',     '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>',     '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-0>',     '<Cmd>blast<CR>', opts)
map('n', '<Space>1', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<Space>2', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<Space>3', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<Space>4', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<Space>5', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<Space>6', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<Space>7', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<Space>8', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<Space>9', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
map('n', '<Space>0', '<Cmd>blast<CR>', opts)

map('n', '<Space>,', '<Cmd>bprevious<CR>', opts)
map('n', '<Space>.', '<Cmd>bnext<CR>', opts)

map('n', '<Space>b', '<Cmd>BookmarksListAll<CR>', opts)
map('n', '<Space>c', '<Cmd>bdelete<CR>', opts)
map('n', '<Space>e', '<Cmd>NvimTreeToggle<CR>', opts)

map('n', '<Space>f', '<Cmd>Telescope find_files prompt_prefix=🔍<CR>', opts)
map('n', '<Space>F', "<Cmd>execute 'Telescope live_grep prompt_prefix=🔍 default_text=' . expand('<cword>')<CR>", opts)

map('n', '<Space>m', '<Cmd>MarksListAll<CR>', opts)
map('n', '<Space>o', '<Cmd>LSoutlineToggle<CR>', opts)
map('n', '<Space>q', '<Cmd>quitall<CR>', opts)
map('n', '<Space>t', '<Cmd>TodoTelescope<CR>', opts)
map('n', '<Space>w', '<Cmd>write<CR>', opts)

map('n', '<Space>zb', '<Cmd>ToggleTerm direction=tab<CR>', opts)
map('n', '<Space>zf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<Space>zd', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)
map('n', '<Space>zd', '<Cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
map('n', '<Space>zl', '<Cmd>BufferLineTogglePin<CR>', opts)
map('n', '<Space>zp', '<Cmd>BufferLinePick<CR>', opts)
map('n', '<Space>zr', '<Cmd>TroubleToggle<CR>', opts)
map('n', '<Space>zt', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<Space>zzf', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<Space>zzl', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

map('n', '[d', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
map('n', ']d', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
map('n', '[e', '<Cmd>lua require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>', opts)
map('n', ']e', '<Cmd>lua require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>', opts)

map('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
map('n', 'gd', '<Cmd>Lspsaga lsp_finder<CR>', opts)
map('n', 'ge', '<Cmd>Lspsaga peek_definition<CR>', opts)
map('n', 'gf', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'gh', '<Cmd>Lspsaga hover_doc<CR>', opts)
map('n', 'gi', '<Cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', 'gl', '<Cmd>LazyGit<CR>', opts)
map('n', 'gs', '<Cmd>Telescope lsp_document_symbols<CR>', opts)
map('n', 'gr', '<Cmd>Telescope lsp_references<CR>', opts)

-- Visual mode
map('v', '<Space>f', '<Esc><Cmd>lua vim.lsp.buf.range_formatting()<CR>', opts)
