local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end

vim.cmd "packadd packer.nvim"

local packer = require'packer'
local util = require'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return require('packer').startup(function(use)
    use {'wbthomason/packer.nvim',
        run = ":PackerUpdate"}
    use {"olimorris/onedarkpro.nvim", config = function()
            require("onedarkpro").setup()
        end
    }
    use {'lewis6991/gitsigns.nvim', config = function()
            require('gitsigns').setup()
        end
    }
    use { 'feline-nvim/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }, config = function()
            require('feline').setup()
        end
    }
    use {'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use {'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        config = function()
            require("nvim-tree").setup()
        end
    }
    use {'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'nvim-treesitter/nvim-treesitter'},
            {'kyazdani42/nvim-web-devicons'},
        },
        config = function()
            require('telescope').setup()
        end
    }
    use {'kdheepak/lazygit.nvim'}
    use {"akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup()
    end}
    use {"folke/which-key.nvim", config = function()
        require("which-key").setup {}
    end}
    use {"neovim/nvim-lspconfig"}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("trouble").setup {
        }
    end}
end)

