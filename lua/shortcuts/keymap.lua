local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Normal mode
map('n', 'n', 'nzz', opts)
map('n', 'N', 'Nzz', opts)
map('n', '<A-Enter>', 'i<CR><Esc>', opts)

map('n', '<F2>', '<Cmd>lua require("renamer").rename()<CR>', opts)
map('n', '<F4>', '<Cmd>CMake configure<CR>', opts)
map('n', '<C-F5>', '<Cmd>CMake build_and_debug<CR>', opts)
map('n', '<F5>', '<Cmd>DapContinue<CR>', opts)
map('n', '<F8>', '<Cmd>DapToggleBreakpoint<CR>', opts)
map('n', '<F9>', '<Cmd>DapStepInto<CR>', opts)
map('n', '<F10>', '<Cmd>DapStepOver<CR>', opts)
map('n', '<F11>', '<Cmd>DapStepOut<CR>', opts)

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

-- map('n', '<Space>b', '<Cmd>BookmarksListAll<CR>', opts)
map('n', '<Space>c', '<Cmd>bdelete<CR>', opts)
map('n', '<Space>e', '<Cmd>NeoTreeReveal<CR>', opts)
map('n', '<Space>f', '<Cmd>Telescope find_files prompt_prefix=🔍<CR>', opts)
map('n', '<Space>F', "<Cmd>execute 'Telescope live_grep prompt_prefix=🔍 default_text=' . expand('<cword>')<CR>", opts)
map('n', '<Space>d', '<Cmd>TodoTelescope<CR>', opts)
map('n', '<Space>l', '<Cmd>BufferLineTogglePin<CR>', opts)
-- map('n', '<Space>m', '<Cmd>MarksListAll<CR>', opts)
map('n', '<Space>q', "<Cmd>lua local f = function() vim.cmd('NeoTreeRevealToggle') vim.cmd('quitall') end f()<CR>", opts)
map('n', '<Space>p', '<Cmd>BufferLinePick<CR>', opts)
map('n', '<Space>t', '<Cmd>ToggleTerm<CR>', opts)
map('n', '<Space>T', '<Cmd>Trouble diagnostics toggle<CR>', opts)
map('n', '<Space>w', '<Cmd>write<CR>', opts)

map('n', '<Space>zb', '<Cmd>ToggleTerm direction=tab<CR>', opts)
map('n', '<Space>zf', '<Cmd>ToggleTerm direction=float<CR>', opts)
map('n', '<Space>zd', '<Cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '<Space>zl', '<Cmd>lua vim.diagnostic.setloclist()<CR>', opts)

map('n', 'gD', '<Cmd>lua require("dapui").eval()<CR>', opts)
map('n', 'gl', '<Cmd>LazyGit<CR>', opts)
map('n', 'ma', '<Cmd>BookmarksCommands<CR>', opts)
map('n', 'mg', '<Cmd>BookmarksGotoRecent<CR>', opts)
map('n', 'mm', '<Cmd>BookmarksMark<CR>', opts)
map('n', 'mo', '<Cmd>BookmarksGoto<CR>', opts)

