local M = {}
function M.setup()
    require('jdtls').start_or_attach({
        cmd = {'java-lsp.sh', os.getenv('HOME') .. '/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')},
        root_dir = require('jdtls.setup').find_root({'gradle.build', 'pom.xml', '.git'})
    })

    -- Utility servers
    local map = function(type, key, value)
        vim.api.nvim_buf_set_keymap(0, type, key, value, {noremap = true, silent = true});
    end
    map('n', '<leader>af', '<cmd>lua require"jdtls".code_action()<CR>')
    -- Diagnostics mapping
    map('n', '<leader>ai', '<Cmd>lua require"jdtls".organize_imports()<CR>')
    map('n', '<leader>av', '<Cmd>lua require("jdtls").extract_variable()<CR>')
    map('v', '<leader>av', '<Esc><Cmd>lua require("jdtls").extract_variable(true)<CR>')
    map('v', '<leader>am', '<Esc><Cmd>lua require("jdtls").extract_method(true)<CR>')
    map('n', '<leader>aF', '<Cmd>lua require("jdtls").code_action(false, "refactor")<CR>')
    map('n', 'ga', '<Cmd>lua require("jdtls").code_action()<CR>')
end

return M
