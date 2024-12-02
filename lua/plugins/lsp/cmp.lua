return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
                {
                    "windwp/nvim-autopairs",
                    opts = {
                        fast_wrap = {},
                        disable_filetype = { "TelescopePrompt", "vim" },
                    },
                    config = function(_, opts)
                        require("nvim-autopairs").setup(opts)

                        -- setup cmp for autopairs
                        local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                    end,
                },

                {
                    "L3MON4D3/LuaSnip",
                    dependencies = {"rafamadriz/friendly-snippets"},
                    opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                    config = function()
                        require("luasnip.loaders.from_vscode").lazy_load()
                    end,
                },

                {
                    "zbirenbaum/copilot-cmp",
                    dependencies = {
                        {
                            "zbirenbaum/copilot.lua",
                            opts = {
                                panel = {
                                    enabled = false,
                                },
                                suggestions = {
                                    enabled = false,
                                }
                            },
                        },
                    },
                    opts = {},
                },

                {
                    require("plugins.lsp.cfg"),
                    "saadparwaiz1/cmp_luasnip",
                    "hrsh7th/cmp-nvim-lua",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-buffer",
                    "hrsh7th/cmp-path",

                    -- Appearance
                    "onsails/lspkind.nvim",
                },
            },
            opts = function()
                local cmp = require("cmp")
                vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6338A8"})
                return {
                    snippet = {
                        -- REQUIRED - you must specify a snippet engine
                        expand = function(args)
                            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                        end,
                    },
                    mapping = cmp.mapping.preset.insert({
                        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
                        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
                        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                        ['<C-f>'] = cmp.mapping.scroll_docs(4),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-e>'] = cmp.mapping.abort(),
                        ['<Tab>'] = cmp.mapping.confirm({ select = true }),
                    }),
                    sources = cmp.config.sources({
                        { name = "copilot" },
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' },
                        { name = 'buffer' },
                        { name = 'path' },
                    }),
                    formatting = {
                        format = require("lspkind").cmp_format({
                        -- mode = "symbol",
                        symbol_map = {
                            Copilot = "",
                        },
                    }),
                    },
                    experimental = {
                        ghost_text = true,
                    },
                }
            end,
        }
