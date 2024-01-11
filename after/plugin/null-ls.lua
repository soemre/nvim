local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.ruff,
        null_ls.builtins.formatting.ruff.with({
            args = { "format", "-n", "--stdin-filename", "$FILENAME", "-" },
        }),
        null_ls.builtins.formatting.beautysh,
    },
})
