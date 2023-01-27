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
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]])

-- vim.api.nvim_create_autocmd("BufWritePost", {
--     group = vim.api.nvim_create_augroup("packer_user_config", { clear = true }),
--     pattern = "plugins.lua",
--     callback = function()
--         require("packer").sync()
--     end
-- })

local packer = require'packer'
local util = require'packer.util'
packer.init({
    package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

return require('packer').startup {function(use)
    use {'wbthomason/packer.nvim'}

    -- Themes
    use {"navarasu/onedark.nvim"}
    use {"Shatur/neovim-ayu"}
    --

    use {"yamatsum/nvim-cursorline"}
    use {"SmiteshP/nvim-navic", requires = {"neovim/nvim-lspconfig"}}
    use {"lewis6991/gitsigns.nvim"}
    use {"kyazdani42/nvim-web-devicons"}
    use {"nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true }}
    use {"akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
    use {"kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" }}
    use {"nvim-telescope/telescope.nvim", requires = {
            {"nvim-lua/plenary.nvim"},
            {"kyazdani42/nvim-web-devicons"},
        }
    }
    use {"chentoast/marks.nvim"}
    use {"kdheepak/lazygit.nvim"}
    use {"akinsho/toggleterm.nvim"}
    use {"folke/which-key.nvim"}
    use {"neovim/nvim-lspconfig"}
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons"}
    use {"hrsh7th/nvim-cmp"}
    use {"hrsh7th/cmp-nvim-lsp"}
    use {"hrsh7th/cmp-buffer"}
    use {"saadparwaiz1/cmp_luasnip"}
    use {"L3MON4D3/LuaSnip"}
    use {"folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim"}
    use {"numToStr/Comment.nvim"}
    use {"filipdutescu/renamer.nvim", requires = "nvim-lua/plenary.nvim"}
    use {"onsails/lspkind.nvim"}
    use {"windwp/nvim-autopairs"}
    use {"ggandor/lightspeed.nvim"}
    use {"startup-nvim/startup.nvim", requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}}
    use {"mfussenegger/nvim-dap"}
    use {"rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap"}
    use {"Shatur/neovim-cmake", requires = {"nvim-lua/plenary.nvim", "mfussenegger/nvim-dap"}}
    use {"j-hui/fidget.nvim", requires = "neovim/nvim-lspconfig"}
    use {"lukas-reineke/indent-blankline.nvim"}
    use {"kevinhwang91/nvim-hlslens", branch = "main"}
    use {"petertriho/nvim-scrollbar", requires = "kevinhwang91/nvim-hlslens"}
    use {"cappyzawa/trim.nvim"}
    use {"glepnir/lspsaga.nvim", branch = "main"}
    use {"ThePrimeagen/vim-be-good"}
    use {"phaazon/mind.nvim", branch = "v2.2", requires = "nvim-lua/plenary.nvim"}
    use {"akinsho/git-conflict.nvim", tag = "*"}
    use {"norcalli/nvim-colorizer.lua"}
    use {"kylechui/nvim-surround", tag = "*"}
    use {"stevearc/overseer.nvim"}
    use {"mrbjarksen/neo-tree-diagnostics.nvim", requires = "nvim-neo-tree/neo-tree.nvim"--[[ , module = "neo-tree.sources.diagnostics" ]]}
    use {"rmagatti/auto-session"}
    use {"kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async"}
    use {"gaoDean/autolist.nvim"}
    use {"smjonas/live-command.nvim"}
    use {"folke/noice.nvim", requires = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"}}
    use {"nat-418/boole.nvim"}

    if packer_bootstrap then
        require("packer").sync()
    end
end,
config = {
    maxjobs = 4,
}}
