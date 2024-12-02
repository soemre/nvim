return{
    "neovim/nvim-lspconfig",
    lazy = false,
    event = "User FilePost",
    config = function()
        local cfg = require("lspconfig")

        cfg.rust_analyzer.setup {}
        cfg.pyright.setup {}
        cfg.lua_ls.setup {}
    end,
    dependencies = {
        {
            "williamboman/mason-lspconfig.nvim",
            dependencies = {
                {
                    "williamboman/mason.nvim",
                    opts = {
                        max_concurrent_installers = 10,
                    },
                },
            },
            opts = {
                automatic_installation = true,
            }
        },
    }
}
