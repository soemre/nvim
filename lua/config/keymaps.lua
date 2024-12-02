local function maps(keymaps)
    for _, map in ipairs(keymaps) do
        local mode, lhs, rhs, options = unpack(map)
        -- Set the keymap
        vim.keymap.set(mode, lhs, rhs, options)
    end
end

local ls = require("luasnip")

maps({
    -- Move lines
    {"v", "J", ":m '>+1<CR>gv=gv"},
    {"v", "K", ":m '<-2<CR>gv=gv"},
    {"v" , "<", "<gv"},
    {"v" , ">", ">gv"},

    -- Pane navigation
    {"n", "<C-h>", "<C-w>h"},
    {"n", "<C-j>", "<C-w>j"},
    {"n", "<C-k>", "<C-w>k"},
    {"n", "<C-l>", "<C-w>l"},

    -- Pane Swap
    {"n", "<C-S-h>", "<C-w>H"},
    {"n", "<C-S-j>", "<C-w>J"},
    {"n", "<C-S-k>", "<C-w>K"},
    {"n", "<C-S-l>", "<C-w>L"},

    -- Switch Buffers
    {"n", "<Tab>", "gt"},
    {"n", "<S-Tab>", "gT"},

    -- Toogle Explorers
    {"n", "<C-S-e>", function()
        local tree = require("nvim-tree.api").tree
        if tree.is_tree_buf() then
            tree.close()
        else
            tree.focus()
        end
    end},
    { "n", "<leader>f", ":Telescope find_files<CR>" },
    { "n", "<leader>T", ":TodoTelescope<CR>" },

    -- Snippet
    {{"i"}, "<C-K>", function() ls.expand() end, {silent = true}},
    {{"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true}},
    {{"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true}},
    {{"i", "s"}, "<C-E>", function()
        if ls.choice_active() then
            ls.change_choice(1)
        end
    end, {silent = true}},

    -- Comment
    {"v", "<C-/>", "gc", { remap = true, silent = true }},
    {{ "n", "i" }, "<C-/>", require('Comment.api').toggle.linewise.current, { remap = true, silent = true }},

    -- Inlay hints
    {{ "n", "v" }, "<leader>L", function()
        vim.lsp.inlay_hint.enable(vim.lsp.inlay_hint.is_enabled())
    end, { silent = true }},
})
