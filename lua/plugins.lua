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

return require('packer').startup {function(use)
    use {'wbthomason/packer.nvim'}
    use {"yamatsum/nvim-cursorline"}
    use {"Shatur/neovim-ayu"}
    use {'navarasu/onedark.nvim'}
    use {'lewis6991/gitsigns.nvim'}
    use {'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}
    use {'SmiteshP/nvim-gps', requires = {"nvim-treesitter/nvim-treesitter"}} 
    -- use {'romgrk/barbar.nvim', requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use {'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' }}
    use {'nvim-telescope/telescope.nvim', requires = {
            {'nvim-lua/plenary.nvim'},
            {'kyazdani42/nvim-web-devicons'},
        }
    }
    use {'chentoast/marks.nvim'}
    use {'kdheepak/lazygit.nvim'}
    use {"akinsho/toggleterm.nvim"}
    use {"folke/which-key.nvim"}
    use {"neovim/nvim-lspconfig"}
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {"hrsh7th/nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"saadparwaiz1/cmp_luasnip"}
    use {"L3MON4D3/LuaSnip"}
    use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}
    use {"numToStr/Comment.nvim"}
    use {"filipdutescu/renamer.nvim", requires = "nvim-lua/plenary.nvim"}
    use {'onsails/lspkind.nvim'}
    use {"olimorris/onedarkpro.nvim"}
    use {"windwp/nvim-autopairs"}
    use {"ggandor/lightspeed.nvim"}
    use {"startup-nvim/startup.nvim", requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}}
    use {"mfussenegger/nvim-dap"}
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {"Shatur/neovim-cmake", requires = {"nvim-lua/plenary.nvim", "mfussenegger/nvim-dap"}} 
    use {"j-hui/fidget.nvim", requires = {"neovim/nvim-lspconfig"}}
    use {"ray-x/lsp_signature.nvim"}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {"petertriho/nvim-scrollbar", requires = {"kevinhwang91/nvim-hlslens"}}
    use {"cappyzawa/trim.nvim"}

    if packer_bootstrap then
        require('packer').sync()
    end
end,
config = {
    maxjobs = 4,
}}

