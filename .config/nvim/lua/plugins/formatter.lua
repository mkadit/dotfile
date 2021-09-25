local prettier = {
    function()
        return {
            exe = "prettier",
            args = {
                "--stdin-filepath",
                vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                "--config",
                os.getenv "HOME" .. "/.config/nvim/.prettierc",
            },
            stdin = true,
        }
    end,
}

local white_space = {

    function()
        return { exe = "sed", args = { "-i 's/[ \t]*$//'" }, stdin = true }
    end,
}

local stylua = {
    function()
        return {
            exe = "stylua",
            args = {
                "--config-path " .. os.getenv "HOME" .. "/.config/nvim/stylua.toml",
                "-",
            },
            stdin = true,
        }
    end,
}

local python = {
    -- autopep8
    function()
        return {
            exe = "black",
            args = {
                "-",
            },
            stdin = true,
        }
    end,
}

local rust = {
    function()
        return { exe = "rustfmt", args = { "--emit=stdout" }, stdin = true }
    end,
}

require("formatter").setup {
    logging = false,
    filetype = {
        rust = rust,
        lua = stylua,
        python = python,
        html = prettier,
        htmldjango = prettier,
        css = prettier,
        javascript = prettier,
        markdown = prettier,
        text = white_space,
    },
}
