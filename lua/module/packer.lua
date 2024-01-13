vim.cmd [[packadd packer.nvim]]

return require('packer').startup(
    function(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.5',
            -- or                            , branch = '0.1.x',
            requires = { { 'nvim-lua/plenary.nvim' } }
        }

        use {
            'rose-pine/neovim',
            as = 'rose-pine',
            config = function() vim.cmd.colorscheme('rose-pine') end
        }

        use {
            'nvim-treesitter/nvim-treesitter',
            run = function()
                local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
                ts_update()
            end,
        }

        use("ThePrimeagen/harpoon")
        use("mbbill/undotree")
        use("tpope/vim-fugitive")

        use {
            'nvim-lualine/lualine.nvim',
            requires = { 'nvim-tree/nvim-web-devicons' }
        }

        use {
            "nvim-tree/nvim-tree.lua",
            requires = { "nvim-tree/nvim-web-devicons" }
        }

        use {
            "folke/trouble.nvim",
            requires = { "nvim-tree/nvim-web-devicons" }
        }

        use("airblade/vim-gitgutter")

        use("norcalli/nvim-colorizer.lua")

        -- LSP & Formatter
        use {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            requires = {
                --- Manage LSP servers from neovim
                { 'williamboman/mason.nvim' },
                { 'williamboman/mason-lspconfig.nvim' },

                -- LSP Support
                { 'neovim/nvim-lspconfig' },

                -- Inlay Hints
                { 'lvimuser/lsp-inlayhints.nvim' },

                -- Autocompletion
                { 'hrsh7th/nvim-cmp' },
                { 'hrsh7th/cmp-buffer' },
                { 'hrsh7th/cmp-path' },
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'L3MON4D3/LuaSnip' },
                { 'saadparwaiz1/cmp_luasnip' },
                { 'rafamadriz/friendly-snippets' },
            }
        }

        use {
            'akinsho/flutter-tools.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
                'stevearc/dressing.nvim', -- optional for vim.ui.select

                -- Debuging
                "rcarriga/nvim-dap-ui",
            },
        }

        use {
            "jose-elias-alvarez/null-ls.nvim",
            requires = {
                'nvim-lua/plenary.nvim',
            },
        }

        -- Debuging
        use("mfussenegger/nvim-dap")

        use {
            "theHamsta/nvim-dap-virtual-text",
            requires = {
                "mfussenegger/nvim-dap",
                "nvim-treesitter/nvim-treesitter",
            }
        }

        use {
            "rcarriga/nvim-dap-ui",
            requires = { "mfussenegger/nvim-dap" }
        }
    end
)
