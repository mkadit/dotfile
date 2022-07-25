local lsp_installer = require "mason-lspconfig"
local lspconfig = require "lspconfig"

USER = vim.fn.expand "$USER"
DATA = vim.fn.stdpath "data"

local signs = { Error = "", Warn = "", Hint = "", Info = "" }

for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("mason").setup()
lsp_installer.setup {
  ensure_installed = {
    "bashls",
    "clangd",
    "cmake",
    "dockerls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    "pyright",
    "rust_analyzer",
    "sumneko_lua",
    "svelte",
    "tailwindcss",
    "tsserver",
    "taplo",
    "vimls",
    "yamlls",
  },
}

local installed_lsp = lsp_installer.get_installed_servers()
local path = require "mason-core.path"
local install_root_dir = path.concat { vim.fn.stdpath "data", "mason", "bin" }

for _, server in pairs(installed_lsp) do
  local opts = {
    capabilities = capabilities,
    on_attach = function(client)
      local aerial = require "aerial"
      aerial.on_attach(client)
    end,
  }
  -- -- TODO: Find fix for unable to use in standalone
  if server.name == "rust_analyzer" then
    local extension_path = os.getenv "HOME" .. "/.vscode-oss/extensions/vadimcn.vscode-lldb-1.6.10/"
    local codelldb_path = extension_path .. "adapter/codelldb"
    local liblldb_path = extension_path .. "lldb/lib/liblldb.so"
    require("rust-tools").setup {
      dap = {
        adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
      },
    }
  end
  if server.name == "gopls" then
    require("go").setup {
      go = "go", -- go command, can be go[default] or go1.18beta1
      goimport = "gopls", -- goimport command, can be gopls[default] or goimport
      fillstruct = "gopls", -- can be nil (use fillstruct, slower) and gopls
      gofmt = "gofumpt", --gofmt cmd,
      max_line_len = 120, -- max line length in goline format
      tag_transform = false, -- can be transform option("snakecase", "camelcase", etc) check gomodifytags for details and more options
      gotests_template = "", -- sets gotests -template parameter (check gotests for details)
      gotests_template_dir = "", -- sets gotests -template_dir parameter (check gotests for details)
      comment_placeholder = "", -- comment_placeholder your cool placeholder e.g. ﳑ       
      icons = opts.on_attach, -- setup to `false` to disable icons setup
      verbose = false, -- output loginf in messages
      lsp_cfg = false, -- true: use non-default gopls setup specified in go/lsp.lua
      -- false: do nothing
      -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
      --   lsp_cfg = {settings={gopls={matcher='Casnvim-lsp-installereInsensitive', ['local'] = 'your_local_module_path', gofumpt = true }}}
      lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
      lsp_on_attach = nil, -- nil: use on_attach function defined in go/lsp.lua,
      --      when lsp_cfg is true
      -- if lsp_on_attach is a function: use this function as on_attach function for gopls
      lsp_keymaps = true, -- set to false to disable gopls/lsp keymap
      lsp_codelens = true, -- set to false to disable codelens, true by default, you can use a function
      -- function(bufnr)
      --    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap=true, silent=true})
      -- end
      -- to setup a table of codelens
      lsp_diag_hdlr = true, -- hook lsp diag handler
      -- virtual text setup
      lsp_diag_virtual_text = { space = 0, prefix = "" },
      lsp_diag_signs = true,
      lsp_diag_update_in_insert = false,
      lsp_document_formatting = true,
      -- set to true: use gopls to format
      -- false if you want to use other formatter tool(e.g. efm, nulls)
      gopls_cmd = { install_root_dir .. "/gopls" }, -- if you need to specify gopls path and cmd, e.g {"/home/user/lsp/gopls", "-logfile","/var/log/gopls.log" }
      gopls_remote_auto = true, -- add -remote=auto to gopls
      dap_debug = true, -- set to false to disable dap
      dap_debug_keymap = false, -- true: use keymap for debugger defined in go/dap.lua
      -- false: do not use keymap in go/dap.lua.  you must define your own.
      dap_debug_gui = true, -- set to true to enable dap gui, highly recommand
      dap_debug_vt = true, -- set to true to enable dap virtual text
      build_tags = "tag1,tag2", -- set default build tags
      textobjects = false, -- enable default text jobects through treesittter-text-objects
      test_runner = "go", -- one of {`go`, `richgo`, `dlv`, `ginkgo`}
      verbose_tests = true, -- set to add verbose flag to tests
      run_in_floaterm = false, -- set to true to run in float window. :GoTermClose closes the floatterm
      -- float term recommand if you use richgo/ginkgo with terminal color
    }
    opts = require("go.lsp").config()
  elseif server.name == "sumneko_lua" then
    local runtime_path = vim.split(package.path, ";")
    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")
    opts.settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        runtime = {
          -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
          version = "LuaJIT",
          -- Setup your lua path
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          -- library = vim.api.nvim_get_runtime_file("", true),
        },
        -- Do not send telemetry data containing a randomized but unique identifier
        telemetry = {
          enable = false,
        },
      },
    }
  end
  --
  lspconfig[server].setup(opts)
end
