return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    lazy = false,
    dependencies = { 
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { "nvim-treesitter/nvim-treesitter" },
    },
    config = function() 
        require('telescope').load_extension('fzf')
    end,
}
