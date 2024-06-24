return {
    -- Themes
    "Shatur/neovim-ayu",
    "rebelot/kanagawa.nvim",
    "marko-cerovac/material.nvim",
    "catppuccin/nvim",
    "folke/tokyonight.nvim",
    "sainnhe/sonokai",
    {
        "navarasu/onedark.nvim",
        config = function()
            require("onedark").setup {
                code_style = {
                    comments = 'none'
                },
            }
        end
    },
    --
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    "neovim/nvim-lspconfig",
    "peterhoeg/vim-qml",
    "L3MON4D3/LuaSnip",
    { "Shatur/neovim-cmake",  dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" } },
    { "SmiteshP/nvim-navic",  dependencies = { "neovim/nvim-lspconfig" } },
    {
        "akinsho/bufferline.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function()
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
        end
    },
    { "akinsho/git-conflict.nvim", config = function() require('git-conflict').setup() end },
    { "akinsho/toggleterm.nvim",   config = function() require("toggleterm").setup() end },
    {
        "cappyzawa/trim.nvim",
        config = function()
            require("trim").setup {
                -- disable = { "markdown" },
                trim_last_line = false,
                patterns = {
                    [[%s/\s\+$//e]], -- remove unwanted spaces
                    -- [[%s/\($\n\s*\)\+\%$//]],  -- trim last line
                    [[%s/\%^\n\+//]], -- trim first line
                    -- [[%s/^\n$\n/\1/]] -- trim multiline without last line
                },
            }
        end
    },
    -- {
    --     "chentoast/marks.nvim",
    --     config = function()
    --         require('marks').setup {
    --             bookmark_1 = {
    --                 sign = "⚑",
    --                 virt_text = "Attention!",
    --                 annotate = true,
    --             },
    --             bookmark_2 = {
    --                 sign = "⚑",
    --                 virt_text = "",
    --                 annotate = false,
    --             },
    --         }
    --     end
    -- },
    {
        "filipdutescu/renamer.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require('renamer').setup() end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
        config = function()
            require("notify").setup {
                top_down = false,
            }
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
        end
    },
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
        config = function()
            require("todo-comments").setup {
                highlight = {
                    pattern = [[.*<(KEYWORDS).*:]]
                },
                search = {
                    pattern = [[\b(KEYWORDS).*:]]
                }
            }
        end
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
        config = function() require("trouble").setup() end
    },
    { "folke/which-key.nvim", config = function() require("which-key").setup {} end },
    {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
        },
        config = function()
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
            -- vim.api.nvim_create_autocmd("TextChanged", {
            --     pattern = "*",
            --     callback = function()
            --         vim.cmd.normal({ autolist.force_recalculate(nil, nil), bang = false })
            --     end
            -- })
        end
    },
    "ggandor/lightspeed.nvim",
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup {
                lightbulb = {
                    enable = true, -- disables both
                    sign = false,
                    virtual_text = true, -- disables just the one at the end of the line
                },
                outline = {
                    close_after_jump = true,
                    detail = false,
                    layout = 'float',
                },
            }
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
    },
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind-nvim",
    {
        "j-hui/fidget.nvim",
        tag = "legacy",
        event = "LspAttach",
        dependencies =
        "neovim/nvim-lspconfig",
        config = function()
            require("fidget").setup()
        end
    },
    "kdheepak/lazygit.nvim",
    { "kevinhwang91/nvim-hlslens",   branch = "main" },
    -- {
    --     "kevinhwang91/nvim-ufo",
    --     dependencies = {
    --         "kevinhwang91/promise-async",
    --         {
    --             "luukvbaal/statuscol.nvim",
    --             config = function()
    --                 local builtin = require("statuscol.builtin")
    --                 require("statuscol").setup({
    --                     relculright = true,
    --                     segments = {
    --                         { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    --                         { text = { "%s" }, click = "v:lua.ScSa" },
    --                         { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
    --                     },
    --                 })
    --             end,
    --         },
    --     },
    --     event = "BufReadPost",
    --     opts = {
    --         provider_selector = function()
    --             return { "treesitter", "indent" }
    --         end,
    --     },
    --
    --     init = function()
    --         vim.keymap.set("n", "zR", function()
    --             require("ufo").openAllFolds()
    --         end)
    --         vim.keymap.set("n", "zM", function()
    --             require("ufo").closeAllFolds()
    --         end)
    --     end,
    -- },
    -- Folding preview, by default h and l keys are used.
    -- On first press of h key, when cursor is on a closed fold, the preview will be shown.
    -- On second press the preview will be closed and fold will be opened.
    -- When preview is opened, the l key will close it and open fold. In all other cases these keys will work as usual.
    { "anuvyklack/fold-preview.nvim", dependencies = "anuvyklack/keymap-amend.nvim", config = true },
    --  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" },
    -- config = function() require("nvim-tree").setup() end },
    -- { "kyazdani42/nvim-web-devicons" },
    { "kylechui/nvim-surround",      config = function() require("nvim-surround").setup() end },
    { "lewis6991/gitsigns.nvim",     config = function() require('gitsigns').setup() end },
    {
        "lukas-reineke/indent-blankline.nvim", main = "ibl",
        config = function() require("ibl").setup() end
    },
    "mfussenegger/nvim-dap",
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    },
    "mrbjarksen/neo-tree-diagnostics.nvim",
    {
        "nat-418/boole.nvim",
        config = function()
            require("boole").setup {
                mappings = {
                    increment = '<C-a>',
                    decrement = '<C-x>'
                },
            }
        end
    },
    { "norcalli/nvim-colorizer.lua",   config = function() require('colorizer').setup() end },
    {
        "numToStr/Comment.nvim",
        config = function()
            require('Comment').setup()
        end
    },
    { "nvim-lualine/lualine.nvim",     dependencies = { "kyazdani42/nvim-web-devicons", opt = true } },
    { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "BurntSushi/ripgrep" } },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = { "c", "cpp", "rust", "cmake", "markdown", "markdown_inline" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    -- additional_vim_regex_highlighting = true,
                },
                indent = {
                    enable = true,
                },
            }
        end
    },
    "onsails/lspkind.nvim",
    {
        "petertriho/nvim-scrollbar",
        dependencies = "kevinhwang91/nvim-hlslens",
        config = function()
            require("scrollbar").setup()
            require("scrollbar.handlers.search").setup()
        end
    },
    {
        "phaazon/mind.nvim",
        branch = "v2.2",
        dependencies = "nvim-lua/plenary.nvim",
        config = function() require("mind").setup() end
    },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup {
                loglevel = "error",
                auto_session_supress_dirs = { "~/", "~/Projects", "~/Downloads", "/" }
            }
        end
    },
    "saadparwaiz1/cmp_luasnip",
    {
        "smjonas/live-command.nvim",
        config = function()
            require("live-command").setup {
                commands = {
                    Norm = { cmd = "norm" },
                },
            }
        end
    },
    "slint-ui/vim-slint",
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
        config = function()
            require "startup".setup({ theme = "startify" })
        end
    },
    { "stevearc/overseer.nvim",  config = function() require("overseer").setup() end },
    { "windwp/nvim-autopairs",   config = function() require("nvim-autopairs").setup() end },
    {
        "yamatsum/nvim-cursorline",
        config = function()
            require('nvim-cursorline').setup {
                cursorline = {
                    enable = false,
                    timeout = 0,
                    number = true,
                },
                cursorword = {
                    enable = true,
                    min_length = 1,
                    hl = { --[[ bg = '#4d4d4d', ]] underline = true },
                }
            }
        end
    },
    {
        "LintaoAmons/bookmarks.nvim",
        lazy = false,
        tag = "v0.5.3",
        dependencies = {
            { "nvim-telescope/telescope.nvim" },
            { "stevearc/dressing.nvim" } -- optional: to have the same UI shown in the GIF
        }
    },
    "LintaoAmons/cd-project.nvim",
    "Shadowsith/vim-ruby-autocomplete",
}
