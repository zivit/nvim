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

return require('packer').startup { function(use)
    use { 'wbthomason/packer.nvim' }

    -- Themes
    use { "navarasu/onedark.nvim" }
    use { "Shatur/neovim-ayu" }
    --

    use { "L3MON4D3/LuaSnip" }
    use { "Shatur/neovim-cmake", requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } }
    use { "SmiteshP/nvim-navic", requires = { "neovim/nvim-lspconfig" } }
    use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons", config = function()
        require("bufferline").setup {
            options = {
                numbers = function(opts)
                    return string.format('%s', opts.raise(opts.ordinal))
                end,
                offsets = { {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    -- text_align = "left"
                } },
                diagnostics = "nvim_lsp",
                separator_style = "slant",
            }
        }
    end }
    use { "akinsho/git-conflict.nvim", tag = "*", config = function() require('git-conflict').setup() end }
    use { "akinsho/toggleterm.nvim", config = function() require("toggleterm").setup() end }
    use { "cappyzawa/trim.nvim", config = function()
        require("trim").setup {
            disable = { "markdown" },
            trim_last_line = false,
            patterns = {
                [[%s/\s\+$//e]], -- remove unwanted spaces
                -- [[%s/\($\n\s*\)\+\%$//]],  -- trim last line
                [[%s/\%^\n\+//]], -- trim first line
                -- [[%s/^\n$\n/\1/]] -- trim multiline without last line
            },
        }
    end }
    use { "chentoast/marks.nvim", config = function()
        require('marks').setup {
            bookmark_1 = {
                sign = "⚑",
                virt_text = "Attention!",
                annotate = true,
            },
            bookmark_2 = {
                sign = "⚑",
                virt_text = "",
                annotate = false,
            },
        }
    end }
    use { "filipdutescu/renamer.nvim", requires = "nvim-lua/plenary.nvim",
        config = function() require('renamer').setup() end }
    use { "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            require("noice").setup {
                views = {
                    cmdline_popup = {
                        position = {
                            row = 5,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                    },
                    popupmenu = {
                        relative = "editor",
                        position = {
                            row = 8,
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = 10,
                        },
                        border = {
                            style = "rounded",
                            padding = { 0, 1 },
                        },
                        win_options = {
                            winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                        },
                    },
                },
            }
        end }
    use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                highlight = {
                    pattern = [[.*<(KEYWORDS).*:]]
                },
                search = {
                    pattern = [[\b(KEYWORDS).*:]]
                }
            }
        end }
    use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end }
    use { "folke/which-key.nvim", config = function() require("which-key").setup {} end }
    use { "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        }, config = function()
            local autolist = require("autolist")
            autolist.setup()
            autolist.create_mapping_hook("i", "<CR>", autolist.new)
            autolist.create_mapping_hook("i", "<Tab>", autolist.indent)
            autolist.create_mapping_hook("i", "<S-Tab>", autolist.indent, "<C-D>")
            autolist.create_mapping_hook("n", "o", autolist.new)
            autolist.create_mapping_hook("n", "O", autolist.new_before)
            autolist.create_mapping_hook("n", ">>", autolist.indent)
            autolist.create_mapping_hook("n", "<<", autolist.indent)
            autolist.create_mapping_hook("n", "<C-r>", autolist.force_recalculate)
            autolist.create_mapping_hook("n", "<leader>x", autolist.invert_entry, "")
            vim.api.nvim_create_autocmd("TextChanged", {
                pattern = "*",
                callback = function()
                    vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
                end
            })
        end }
    use { "ggandor/lightspeed.nvim" }
    use { "glepnir/lspsaga.nvim", branch = "main", config = function() require("lspsaga").setup() end }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/nvim-cmp" }
    use { "j-hui/fidget.nvim", requires = "neovim/nvim-lspconfig", config = function() require("fidget").setup() end }
    use { "kdheepak/lazygit.nvim" }
    use { "kevinhwang91/nvim-hlslens", branch = "main" }
    use { "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" }
    use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" },
        config = function() require("nvim-tree").setup() end }
    use { "kyazdani42/nvim-web-devicons" }
    use { "kylechui/nvim-surround", tag = "*", config = function() require("nvim-surround").setup() end }
    use { "lewis6991/gitsigns.nvim", config = function() require('gitsigns').setup() end }
    use { "lukas-reineke/indent-blankline.nvim",
        config = function() require("indent_blankline").setup { show_current_context = true, } end }
    use { "mfussenegger/nvim-dap" }
    use { "mrbjarksen/neo-tree-diagnostics.nvim", requires = "nvim-neo-tree/neo-tree.nvim" --[[ , module = "neo-tree.sources.diagnostics" ]] }
    use { "nat-418/boole.nvim", config = function()
        require("boole").setup {
            mappings = {
                increment = '<C-a>',
                decrement = '<C-x>'
            },
        }
    end }
    use { "neovim/nvim-lspconfig" }
    use { "norcalli/nvim-colorizer.lua", config = function() require('colorizer').setup() end }
    use { "numToStr/Comment.nvim", config=function ()
        require('Comment').setup()
    end }
    use { "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } }
    use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" }, { "kyazdani42/nvim-web-devicons" } } }
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
        require("nvim-treesitter.configs").setup {
            ensure_installed = { "c", "cpp", "rust", "cmake" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                -- additional_vim_regex_highlighting = true,
            },
        }
    end }
    use { "onsails/lspkind.nvim" }
    use { "petertriho/nvim-scrollbar", requires = "kevinhwang91/nvim-hlslens",
        config = function() require("scrollbar").setup() require("scrollbar.handlers.search").setup() end }
    use { "phaazon/mind.nvim", branch = "v2.2", requires = "nvim-lua/plenary.nvim",
        config = function() require("mind").setup() end }
    use { "rcarriga/nvim-dap-ui", requires = "mfussenegger/nvim-dap" }
    use { "rmagatti/auto-session", config = function() require("auto-session").setup() end }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "smjonas/live-command.nvim", config = function()
        require("live-command").setup {
            commands = {
                Norm = { cmd = "norm" },
            },
        }
    end }
    use { "startup-nvim/startup.nvim", requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function() require "startup".setup({ theme = "startify" })
    end }
    use { "stevearc/overseer.nvim" ,config=function () require("overseer").setup() end}
    use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup() end }
    use { "yamatsum/nvim-cursorline", config = function()
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
    end }
    if packer_bootstrap then
        require("packer").sync()
    end
end,
    config = {
        maxjobs = 4,
    } }

