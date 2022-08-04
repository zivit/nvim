vim.cmd "packadd packer.nvim"

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use({
        "olimorris/onedarkpro.nvim",
        config = function()
            require("onedarkpro").setup()
        end
    })
    use({
        'feline-nvim/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function()
            require('feline').setup()
        end
    })
end)
