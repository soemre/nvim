return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },
    {
        "nvim-tree/nvim-tree.lua", version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        opts = {}
    },
    require("plugins.ui.themes"),
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = { char = "▏" },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufEnter",
        dependencies = {
            require("plugins.treesitter"),
        },
        opts = {}
    },
    {
        "theHamsta/nvim-dap-virtual-text",
        event = "BufEnter",
        dependencies = {
            require("plugins.treesitter"),
            require("plugins.lsp.dap"),
        },
        opts = {},
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}
    },
    require("plugins.ui.lualine"),
    require("plugins.ui.bufferline"),
}

