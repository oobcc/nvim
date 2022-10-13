local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.blue,
        null_ls.builtins.formatting.stylua,
    },
})
