function vim.getVisualSelection()
	vim.cmd('noau normal! "vy"')
	local text = vim.fn.getreg('v')
	vim.fn.setreg('v', {})

	text = string.gsub(text, "\n", "")
	if #text > 0 then
		return text
	else
		return ''
	end
end

local keymap = vim.keymap.set
local tb = require('telescope.builtin')
local opts = { noremap = true, silent = true }

keymap('v', '<space>fg', function()
	local text = vim.getVisualSelection()
	tb.live_grep({ default_text = text })
end, opts)

require('telescope').setup {
    pickers = {
        find_files = {
            find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" }
        }
    }
}
