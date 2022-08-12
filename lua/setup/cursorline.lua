require('nvim-cursorline').setup {
    cursorline = {
        enable = true,
        timeout = 0,
        number = true,
    },
    cursorword = {
        enable = true,
        min_length = 1,
        hl = { bg = '#4d4d4d', underline = false },
    }
}
