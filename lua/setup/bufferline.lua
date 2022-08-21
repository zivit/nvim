require("bufferline").setup{
    options = {
        -- separator_style = "padded_slant",
        numbers = function(opts)
            return string.format('%s', opts.raise(opts.ordinal))
        end,
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            -- text_align = "left"
        }},
        diagnostics = "nvim_lsp"
    }
}

