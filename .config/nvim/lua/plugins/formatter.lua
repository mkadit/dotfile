local null_ls = require "null-ls"

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath "config" .. "/.prettierrc"
local sources = {
    null_ls.builtins.formatting.stylua.with {
        args = {
            "--config-path",
            vim.fn.stdpath "config" .. "/stylua.toml",
            "-",
        },
    },
    null_ls.builtins.formatting.prettierd.with {
        filetypes = {
            "css",
            "html",
            "javascript",
            "javascriptreact",
            "javascript.jsx",
            "json",
            "jsonc",
            "markdown",
            "svelte",
            "typescript",
            "typescriptreact",
            "vue",
            "yaml",
        },
    },
    null_ls.builtins.formatting.autopep8,
    null_ls.builtins.formatting.shfmt,
    null_ls.builtins.diagnostics.shellcheck,
    -- null_ls.builtins.diagnostics.eslint,
    -- null_ls.builtins.code_actions.eslint,
    -- null_ls.builtins.formatting.eslint,
    -- null_ls.builtins.diagnostics.write_good,
    -- null_ls.builtins.code_actions.gitsigns,
}

require("null-ls").setup {
    debounce = 150,
    sources = sources,
}
