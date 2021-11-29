-- local prettier = {
--     function()
--         return {
--             exe = "prettier",
--             args = {
--                 "--stdin-filepath",
--                 vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
--                 "--config",
--                 os.getenv "HOME" .. "/.config/nvim/.prettierc",
--             },
--             stdin = true,
--         }
--     end,
-- }

-- local white_space = {

--     function()
--         return { exe = "sed", args = { "-i 's/[ \t]*$//'" }, stdin = true }
--     end,
-- }

-- local stylua = {
--     function()
--         return {
--             exe = "stylua",
--             args = {
--                 "--config-path " .. os.getenv "HOME" .. "/.config/nvim/stylua.toml",
--                 "-",
--             },
--             stdin = true,
--         }
--     end,
-- }

-- local python = {
--     -- autopep8
--     function()
--         return {
--             exe = "black",
--             args = {
--                 "-",
--             },
--             stdin = true,
--         }
--     end,
-- }

-- local rust = {
--     function()
--         return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
--     end,
-- }

-- require("formatter").setup {
--     logging = false,
--     filetype = {
--         rust = rust,
--         lua = stylua,
--         python = python,
--         html = prettier,
--         htmldjango = prettier,
--         css = prettier,
--         javascript = prettier,
--         markdown = prettier,
--         text = white_space,
--     },
-- }


local null_ls = require("null-ls")

vim.env.PRETTIERD_DEFAULT_CONFIG = vim.fn.stdpath "config" .. "/.prettierrc"
local sources = {
    null_ls.builtins.formatting.stylua.with{
        args = {
            "--config-path",
            vim.fn.stdpath("config") .. "/stylua.toml",
            "-"
        }
    },
    null_ls.builtins.formatting.prettierd.with{
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
        }
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

null_ls.config({ debounce = 150,sources = sources })
require("lspconfig")["null-ls"].setup({})
