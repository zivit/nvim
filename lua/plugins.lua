local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
  print "Cloning packer..."
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local packer = require'packer'
local util = require'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return require('packer').startup({function(use)

    use {'wbthomason/packer.nvim'}
    
    use {"yamatsum/nvim-cursorline", config = function() 
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
    end}
    use {"Shatur/neovim-ayu", config = function()
        require("ayu").setup({
            mirage = true,
            overrides = {},
        })
    end}
    use {'navarasu/onedark.nvim'}
    
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
    use {'chentoast/marks.nvim', config = function()
        require('marks').setup()
    end}
    use {'kdheepak/lazygit.nvim'}
    use {"akinsho/toggleterm.nvim", config = function()
        require("toggleterm").setup()
    end}
    use {"folke/which-key.nvim", config = function()
        require("which-key").setup{}
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
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                highlight = {
                    pattern = [[.*<(KEYWORDS).*:]]
                },
                search = {
                    pattern = [[\b(KEYWORDS).*:]]
                }
            }
    end}      

    use {'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {'filipdutescu/renamer.nvim',
        requires = { {'nvim-lua/plenary.nvim'} },
        config = function()
            require('renamer').setup()
        end
    }
    use {'onsails/lspkind.nvim'}
    use {"olimorris/onedarkpro.nvim", config = function()
        require("onedarkpro").setup {
            options = {
                bold = true, -- Use the themes opinionated bold styles?
                italic = false, -- Use the themes opinionated italic styles?
                underline = true, -- Use the themes opinionated underline styles?
                undercurl = true, -- Use the themes opinionated undercurl styles?
                cursorline = true, -- Use cursorhighlight_line highlighting?
                transparency = true, -- Use a transparent background?
                terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
                window_unfocussed_color = false, -- When the window is out of focus, change the normal background?
            }
        }
    end}
    use {"windwp/nvim-autopairs", config = function() 
        require("nvim-autopairs").setup {} end
    }
    
    use 'ggandor/lightspeed.nvim'
    use {
      "startup-nvim/startup.nvim",
      requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"},
      config = function()
        require"startup".setup()
      end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    maxjobs = 4,
}})

